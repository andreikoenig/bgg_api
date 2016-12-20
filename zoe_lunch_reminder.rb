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
               "Who is awesome? You are awesome, cause you give Zoe lunch!",
               "Rain. Sun. Zoe is dog. Zoe want lunch.",
               "Give me an 'L'. Give me a 'U'. Give me an 'N'. That spells LUN!!!! (like in lunch. for Zoe)",
               "L.U.N.C.H. (I know you know what this means)",
               "Hungry Zoe wants lovin'. And food...",
               "What's for lunch, mommy? Woof-woof!",
               "Zoe told me she will trade doggy kisses for some lunch",
               "Today for lunch special, we offer wonderful portion of Natural Balance! Duck and potato family recipe!",
               "Hey... pssttt... sorry to interrupt... lunch for Zoe!",
               "R3m3mb3r 2feed Zoe sum lunch. Kthxbai!",
               "if Zoe.gets(food); Zoe.mood = happy; else; Zoe.stomach = hungry && sad; end",
               "You are so awesome, cause you rememebered Zoe's lunch!",
               "I just wanted to tell you that you are the best wife in the world!!! (also lunch for Zoe)",
               "Hi! Gimme lunch! Thanks, Zoe.",
               "Hi, Zoe called. She wants her lunch.",
               "I just got a hunch, that you forgot Zoe's lunch, Give her some food, To Put her in an amazing mood!",
               "Zoe. Lunch. Zoe. Lunch. Zoe. Lunch."]

    all_sms[rand(0..16)]
  end
end
