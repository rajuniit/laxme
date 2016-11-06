
# Configure your SMS API settings
require 'net/http'
require 'yaml'

class AttendanceManager
  attr_accessor :attendance_file,
                :present_student_message,
                :present_student_parent_message,
                :present_student_recipients,
                :present_student_parent_recipients,
                :absent_student_message,
                :absent_student_parent_message,
                :absent_student_recipients,
                :absent_student_parent_recipients

  def initialize(attendance_file)
    @attendance_file = attendance_file
    @present_student_message = "Thank you, Today You Attend School"
    @present_student_parent_message = "Thank you, Today Your child Attend School"
    @absent_student_message = "Sorry!, Today You don't Attend School"
    @absent_student_parent_message = "Sorry!, Today Your child don't Attend School"

    #Process to get receipient
    batches = Batch.active

    @present_student_recipients = []
    @present_student_parent_recipients = []
    @absent_student_recipients = []
    @absent_student_parent_recipients = []

    @student_ids = []

    file = File.new(@attendance_file, "r")
    while (line = file.gets)
      str_arr = line.split(",")
      id = str_arr[3].delete('"').to_i unless str_arr[3].nil?
      @student_ids.push id unless id.nil?
    end
    file.close

    sms_setting = SmsSetting.new()
    batches.each do |batch|
      batch_students = batch.students
      batch_students.each do |student|
        if @student_ids.include? student.id
          if student.is_sms_enabled
            if sms_setting.student_sms_active
              @present_student_recipients.push student.phone2 unless (student.phone2.nil? or student.phone2 == "")
            end
            if sms_setting.parent_sms_active
              guardian = student.immediate_contact
              unless guardian.nil?
                @present_student_parent_recipients.push guardian.mobile_phone unless (guardian.mobile_phone.nil? or guardian.mobile_phone == "")
              end
            end
          end
        else
          attendance_data = Hash.new
          attendance_data["student_id"] = student.id
          attendance_data["month_date"] = Time.new.strftime("%Y-%m-%d")
          attendance_data["batch_id"] = batch.id
          attendance_data["reason"] = "Unknown"
          attendance_data["forenoon"] = 1
          attendance_data["afternoon"] = 1

          @absentee = Attendance.new(attendance_data)
          @absentee.save
          if student.is_sms_enabled
            if sms_setting.student_sms_active
              @absent_student_recipients.push student.phone2 unless (student.phone2.nil? or student.phone2 == "")
            end
            if sms_setting.parent_sms_active
              guardian = student.immediate_contact
              unless guardian.nil?
                @absent_student_parent_recipients.push guardian.mobile_phone unless (guardian.mobile_phone.nil? or guardian.mobile_phone == "")
              end
            end
          end
        end


      end
    end

    @config = SmsSetting.get_sms_config
    unless @config.blank?
      @sendername = @config['sms_settings']['sendername']
      @sms_url = @config['sms_settings']['host_url']
      @username = @config['sms_settings']['username']
      @password = @config['sms_settings']['password']
      @success_code = @config['sms_settings']['success_code']
      @username_mapping = @config['parameter_mappings']['username']
      @username_mapping ||= 'username'
      @password_mapping = @config['parameter_mappings']['password']
      @password_mapping ||= 'password'
      @phone_mapping = @config['parameter_mappings']['phone']
      @phone_mapping ||= 'phone'
      @sender_mapping = @config['parameter_mappings']['sendername']
      @sender_mapping ||= 'sendername'
      @message_mapping = @config['parameter_mappings']['message']
      @message_mapping ||= 'message'
      unless @config['additional_parameters'].blank?
        @additional_param = ""
        @config['additional_parameters'].split(',').each do |param|
          @additional_param += "&#{param}"
        end
      end
    end
  end

  def perform
    if @config.present?
      message_log = SmsMessage.new(:body=> @message)
      message_log.save
      url = URI.parse("#{@sms_url}")
      req = Net::HTTP::Post.new(url.request_uri)
      req.basic_auth "#{@username}", "#{@password}"

      @present_student_recipients.each do |recipient|
        req.set_form_data({'To'=>"#{recipient}", 'From'=>"#{@sendername}",'Body' => "#{@present_student_message}"})
        http = Net::HTTP.new(url.host, url.port)
        http.use_ssl = (url.scheme == "https")

        begin
          response = http.request(req)
          if response.body.present?
            message_log.sms_logs.create(:mobile=>recipient,:gateway_response=>response.body)
            if @success_code.present?
              if response.body.to_s.include? @success_code
                sms_count = Configuration.find_by_config_key("TotalSmsCount")
                new_count = sms_count.config_value.to_i + 1
                sms_count.update_attributes(:config_value=>new_count)
              end
            end
          end
        rescue Timeout::Error => e
          message_log.sms_logs.create(:mobile=>recipient,:gateway_response=>e.message)
        rescue Errno::ECONNREFUSED => e
          message_log.sms_logs.create(:mobile=>recipient,:gateway_response=>e.message)
        end
      end

      @present_student_parent_recipients.each do |recipient|
        req.set_form_data({'To'=>"#{recipient}", 'From'=>"#{@sendername}",'Body' => "#{@present_student_parent_message}"})
        http = Net::HTTP.new(url.host, url.port)
        http.use_ssl = (url.scheme == "https")

        begin
          response = http.request(req)
          if response.body.present?
            message_log.sms_logs.create(:mobile=>recipient,:gateway_response=>response.body)
            if @success_code.present?
              if response.body.to_s.include? @success_code
                sms_count = Configuration.find_by_config_key("TotalSmsCount")
                new_count = sms_count.config_value.to_i + 1
                sms_count.update_attributes(:config_value=>new_count)
              end
            end
          end
        rescue Timeout::Error => e
          message_log.sms_logs.create(:mobile=>recipient,:gateway_response=>e.message)
        rescue Errno::ECONNREFUSED => e
          message_log.sms_logs.create(:mobile=>recipient,:gateway_response=>e.message)
        end
      end

      @absent_student_recipients.each do |recipient|
        req.set_form_data({'To'=>"#{recipient}", 'From'=>"#{@sendername}",'Body' => "#{@absent_student_message}"})
        http = Net::HTTP.new(url.host, url.port)
        http.use_ssl = (url.scheme == "https")

        begin
          response = http.request(req)
          if response.body.present?
            message_log.sms_logs.create(:mobile=>recipient,:gateway_response=>response.body)
            if @success_code.present?
              if response.body.to_s.include? @success_code
                sms_count = Configuration.find_by_config_key("TotalSmsCount")
                new_count = sms_count.config_value.to_i + 1
                sms_count.update_attributes(:config_value=>new_count)
              end
            end
          end
        rescue Timeout::Error => e
          message_log.sms_logs.create(:mobile=>recipient,:gateway_response=>e.message)
        rescue Errno::ECONNREFUSED => e
          message_log.sms_logs.create(:mobile=>recipient,:gateway_response=>e.message)
        end
      end

      @absent_student_parent_recipients.each do |recipient|
        req.set_form_data({'To'=>"#{recipient}", 'From'=>"#{@sendername}",'Body' => "#{@absent_student_parent_message}"})
        http = Net::HTTP.new(url.host, url.port)
        http.use_ssl = (url.scheme == "https")

        begin
          response = http.request(req)
          if response.body.present?
            message_log.sms_logs.create(:mobile=>recipient,:gateway_response=>response.body)
            if @success_code.present?
              if response.body.to_s.include? @success_code
                sms_count = Configuration.find_by_config_key("TotalSmsCount")
                new_count = sms_count.config_value.to_i + 1
                sms_count.update_attributes(:config_value=>new_count)
              end
            end
          end
        rescue Timeout::Error => e
          message_log.sms_logs.create(:mobile=>recipient,:gateway_response=>e.message)
        rescue Errno::ECONNREFUSED => e
          message_log.sms_logs.create(:mobile=>recipient,:gateway_response=>e.message)
        end
      end


    end
  end
end
