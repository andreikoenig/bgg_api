require "mechanize"
require "pry"
base_url = "http://www.boardgamegeek.com/xmlapi2/"

response = Mechanize.new.get base_url + "forum?id=10"
threads = response.xml.xpath("//threads").first.children.reject{|node| Nokogiri::XML::Text === node}

#each thread has id, subject, author, postdate, lastpostdate.
ten_min_ago = Time.now.utc - 60*360
new_threads = []

threads.each do |thread|
	threadtime = Time.parse(thread["postdate"]).utc
	if threadtime >  ten_min_ago
		link = "https://boardgamegeek.com/thread/#{thread["id"]}"
		new_threads << [thread["subject"], link]
	end
end

binding.pry

puts "hi"



