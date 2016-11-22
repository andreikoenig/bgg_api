require "twilio-ruby"

module ZoeLunchReminder
  module_function
  def run
    	account_sid = ENV["ACCOUNT_SID"]
		auth_token = ENV["AUTH_TOKEN"]

		client = Twilio::REST::Client.new account_sid, auth_token
		from = ENV["TWILIO_NUMBER"]

		marina_number = ENV["MARINA_NUMBER"]
    client.account.messages.create(
			:from => from,
			:to => marina_number,
			:body => "Remember to give some lunch to Zoika! Love you!")
  end
end
