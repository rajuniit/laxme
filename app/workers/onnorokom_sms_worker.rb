require 'savon'

class OnnorokomSmsWorker
  include Sidekiq::Worker
  def perform(name, count)
	client = Savon.client(wsdl: 'http://api2.onnorokomsms.com/sendsms.asmx?wsdl')
        params = Hash.new
      params["userName"] = "01811393240",
      params["userPassword"] = "10abe9",
      params["messageText"] = "Bulk SMS Send from CodeIgniter Test"
      params["numberList"] = "01716528608"
      params["smsType"] = "TEXT"
      params["maskName"] = "DemoMask"
      params["campaignName"] = ""
        response = client.call(:one_to_many, message: params)
  end
end
