require "clockwork"
require_relative "hotdeals"
require_relative "geekbay"
include Clockwork

handler do |job|
  puts "Running #{job}"
end

every(10.minutes, 'check_hot_deals') {HotDeals.run}
every(12.hours, 'check_geek_bay') {GeekBay.run}
