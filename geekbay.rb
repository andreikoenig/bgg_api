require "mechanize"
require "pry"
base_url = "http://www.boardgamegeek.com/xmlapi2/"

twelve_hours_ago = Time.now.utc - 60*60*72
wanted_states = %w(maryland, delaware, virginia, dist of columbia)
params = {
	id: 376624,
	minarticledate: twelve_hours_ago.strftime("%Y-%m-%d %H:%M:%S")

}
response = Mechanize.new.get(base_url + "thread",params)
articles = response.xml.xpath("//articles").first.children.reject{|node| Nokogiri::XML::Text === node}
articles.each do |article|
	username = article["username"]
	user = Mechanize.new.get(base_url + "user?name=#{username}")
	state = user.xml.xpath("//stateorprovince").first["value"]  #nameofstate
binding.pry
	wanted_states.include?(state.downcase) #if true, it is one of the wanted states

end


