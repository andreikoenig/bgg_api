require "mechanize"
require "pry"
base_url = "http://www.boardgamegeek.com/xmlapi2/"

twelve_hours_ago = Time.now.utc - 60*60*12
wanted_states = ["maryland", "delaware", "virginia", "dist of columbia"]
params = {
	id: 376624,
	minarticledate: twelve_hours_ago.strftime("%Y-%m-%d %H:%M:%S")

}
bot = Mechanize.new
response = bot.get(base_url + "thread",params)

articles = response.xml.xpath("//articles").first.children.reject{|node| Nokogiri::XML::Text === node}
articles.each do |article|
	username = article["username"]
	user = bot.get(base_url + "user?name=#{username}")

	state = user.xml.xpath("//stateorprovince").first["value"]  #nameofstate
	city = nil
	if wanted_states.include?(state.downcase) #if true, it is one of the wanted states
		user_profile = Nokogiri::HTML(bot.get("https://boardgamegeek.com/user/#{username}").body)
		user_geo_info = user_profile.css("table.profile_table tr")
		city = user_geo_info[5].children.children[1].text unless user_geo_info[5].children.children.size < 2
		city ||= "N/A"
		user_location = "State: #{state}, City: #{city}"
	end
end


