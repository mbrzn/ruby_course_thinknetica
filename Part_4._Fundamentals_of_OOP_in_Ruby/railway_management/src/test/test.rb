# пусть есть массив объектов с атрибутом type
# создать хэш с ключом, равным аттрибуту
#

wd = '/home/berezin/courses/ruby_course_thinknetica/Part_4._Fundamentals_of_OOP_in_Ruby/railway_management'
# puts "#{wd}/main/train"
require_relative "#{wd}/src/main/train"
require_relative "#{wd}/src/main/station"

types = %i[passenger freight]
trains = []
0.upto(9) do |i|
  number = 100 + i
  number.even? ? (type = types[0]) : (type = types[1])
  size = if type == types[1]
           rand(1..100)
         else
           rand(1..12)
         end
  trains.push(Train.new(number, type, size))
end

def print_trains(arr, banner)
  puts "\nСписок #{banner}\n#{'-' * 50}"
  arr.each { |train| puts format('%3d %-10s %3d %-20s', train.number, train.type, train.size, train) }
end

# все поезда
# print_trains(trains, 'поездов')

# пассажирские
# print_trains(
#   trains.select { |train| train.type == types[0] }, \
#   "#{types[0]} поездов"
# )
# товарные
# types.each do |i|
#   print_trains(
#     trains.select { |train| train.type == i }, \
#     "#{i} поездов"
#   )
# end
#
