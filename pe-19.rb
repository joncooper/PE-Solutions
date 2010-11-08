# PE#19
#
# How many Sundays fell on the first of the month during the twentieth century?
# (1 Jan 1901 to 31 Dec 2000)

require 'date'

def l
  load 'pe-19.rb'
end

start_date = Date.new(1901, 1, 1)
stop_date = Date.new(2000, 12, 31)

# Sunday is day-of-week 0

count = 0
start_date.upto(stop_date) do |day|
  count += 1 if day.wday == 0 and day.mday == 1
end
p count