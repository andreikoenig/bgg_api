require "clockwork"
require_relative "hotdeals"

module Clockwork
	every(10.minutes, 'check_hot_deals') {HotDeals.run}
	every(12.hours, 'check_geek_bay')
end