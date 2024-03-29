# Сделать хеш, содержащий месяцы и количество дней в месяце.
# В цикле выводить те месяцы, у которых количество дней ровно 30
#
require 'date'

months = {}
1.upto(12).each do |i|
  last_day = Date.new(Time.now.year, i, -1).day
  month = Time.mktime(0, i, 1).strftime('%B').to_sym
  months[month] = last_day
end
puts(months)
puts(months.select { |_key, value| value == 30 })
