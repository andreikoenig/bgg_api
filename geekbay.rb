require "mechanize"
require "pry"
base_url = "http://www.boardgamegeek.com/xmlapi2/"

bot = Mechanize.new
twelve_hours_ago = Time.now.utc - 60*60*72
params = {
	id: 376624,  #1527611  #376624 <--
	minarticledate: twelve_hours_ago.strftime("%Y-%m-%d %H:%M:%S")

}
binding.pry
response = bot.get(base_url + "thread",params)
articles = response.xml.xpath("//articles").first.children.reject{|node| Nokogiri::XML::Text === node}
articles.each do |article|
	user = article["username"]
	#get username profile and get zipcode
end


