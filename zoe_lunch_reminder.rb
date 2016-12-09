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
			:body => sms_text)
  end

  def sms_text
    all_sms = ["Remember to give some lunch to Zoika! Love you!",
               "Zoe! Lunch! Lunch! Lunch! Woooooo!",
               "Woof, woof! Can I have some lunch? Thanks, Zoe",
               "Zoe wants some nom nomz",
               "Did you have lunch yet? Zoe wants some too!",
               "Ushki are hungry for some lunch!",
               "What time is it? Zoe's lunch time!",
               "Its noon. You know what that means? Lunch for you and Zoe!",
               "Roses are red, violets are blue, it is 12 in the afternoon, Zoe wants some lunch!",
               "Lunch eat Zoe wants, she does yes!",
               "Zoe will give you doggie kisses if you give her some lunch!",
               "Love you! Will love you more if you give Zoe lunch!",
               "A fed dog is a happy dog! Make Zoe happy - give her some lunch!",
               "Lunch is most important meal of the day! For Zoe!",
               "Hey beautiful! Did you give Zoe lunch yet?",
               "In Soviet Russia, lunch eats dog at noon!",
               "Who is awesome? You are awesome, cause you give Zoe lunch!"]
    all_sms[rand(0..16)]
  end
end
