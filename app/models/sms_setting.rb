class SmsSetting < ApplicationRecord

  def application_sms_active
    application_sms = SmsSetting.find_by_settings_key("ApplicationEnabled")
    return true if application_sms.is_enabled
  end

  def student_sms_active
    student_sms = SmsSetting.find_by_settings_key("StudentSmsEnabled")
    return true if student_sms.is_enabled
  end

  def student_admission_sms_active
    student_sms = SmsSetting.find_by_settings_key("StudentAdmissionEnabled")
    return true if student_sms.is_enabled
  end

  def parent_sms_active
    parent_sms = SmsSetting.find_by_settings_key("ParentSmsEnabled")
    return true if parent_sms.is_enabled
  end

  def employee_sms_active
    employee_sms = SmsSetting.find_by_settings_key("EmployeeSmsEnabled")
    return true if employee_sms.is_enabled
  end

  def attendance_sms_active
    attendance_sms = SmsSetting.find_by_settings_key("AttendanceEnabled")
    return true if attendance_sms.is_enabled
  end

  def event_news_sms_active
    event_news_sms = SmsSetting.find_by_settings_key("NewsEventsEnabled")
    return true if event_news_sms.is_enabled
  end

  def exam_result_schedule_sms_active
    result_schedule_sms = SmsSetting.find_by_settings_key("ExamScheduleResultEnabled")
    return true if result_schedule_sms.is_enabled
  end

  def self.get_sms_config
    if File.exists?(Rails.root.join("config/sms_settings.yml"))
      config = YAML.load_file(File.join(Rails.root,"config","sms_settings.yml"))
    end
    return config
  end

  def self.application_sms_status
    application_sms = SmsSetting.find_by_settings_key("ApplicationEnabled")
    return true if application_sms and application_sms.is_enabled
  end

end
