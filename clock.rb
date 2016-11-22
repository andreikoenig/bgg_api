require "clockwork"
require_relative "hotdeals"
require_relative "geekbay"
require_relative "zoe_lunch_reminder"
include Clockwork

handler do |job|
  puts "Running #{job}"
end

every(10.minutes, 'check_hot_deals') {HotDeals.run}
every(12.hours, 'check_geek_bay') {GeekBay.run}
every(1.day, 'remind_about_zoes_lunch', :at => '17:00') {ZoeLunchReminder.run}
