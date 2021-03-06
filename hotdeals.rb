require "mechanize"
require "twilio-ruby"

module HotDeals
	module_function
	def run
		puts " ~~~~~~ #{Time.now.utc} ~~~~~~ Checking Hot Deals"
		base_url = "http://www.boardgamegeek.com/xmlapi2/"
		account_sid = ENV["ACCOUNT_SID"]
		auth_token = ENV["AUTH_TOKEN"]

		client = Twilio::REST::Client.new account_sid, auth_token
		from = ENV["TWILIO_NUMBER"]

		my_number = ENV["MY_NUMBER"]

		response = Mechanize.new.get base_url + "forum?id=10"
		threads = response.xml.xpath("//threads").first.children.reject{|node| Nokogiri::XML::Text === node}

		hotdeals_file_path = './hotdeal_ids.txt'

		hotdeal_ids = File.open(hotdeals_file_path, 'w')
		puts hotdeal_ids

		hotdeal_ids_array = hotdeal_ids.split(",")
		puts hotdeal_ids_array

		#each thread has id, subject, author, postdate, lastpostdate.
		three_min_ago = Time.now.utc - 60*3

		new_threads = []

		threads.each do |thread|
			puts thread
	    threadtime = Time.parse(thread["postdate"]).utc
	    thread_id = thread["id"]
			if (threadtime > three_min_ago) && (hotdeal_ids_array.include?(thread_id))
				link = "https://boardgamegeek.com/thread/#{thread["id"]}"
				new_threads << [thread["subject"], link]
			end
		end

		if new_threads.empty?
			puts " ~~~~~~ INFO: No new Threads in the last 5 min"
		else		
                        # send sms
			client.account.messages.create(
				:from => from,
				:to => my_number,
				:body => new_threads)
		end
	end
end



