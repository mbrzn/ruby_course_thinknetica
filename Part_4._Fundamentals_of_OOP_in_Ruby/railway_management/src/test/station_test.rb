# тест класса Station
# - [x]
#
#wd = '/home/berezin/courses/ruby_course_thinknetica/Part_4._Fundamentals_of_OOP_in_Ruby/railway_management'
#require_relative "#{wd}/src/main/station"
#require_relative "#{wd}/src/main/train"

puts 'Old pwd: ' +  Dir.pwd;  puts "... -> ..."
#Dir.chdir(wd)
Dir.chdir( 'Part_4._Fundamentals_of_OOP_in_Ruby/railway_management/src' )
puts "New pwd: " + Dir.pwd;   puts "\n"

require_relative "main/linkedlist.rb"
#require_relative "main/route.rb"
require_relative "main/station.rb"
require_relative "main/train.rb"

# создать множество (массив)  поездов
#
types = %i[passenger freight]                         # типология поездов
trains = []

100.upto(109) do |id| 
  id.even? ? (type = types[0]) : (type = types[1])    # пусть четные id - пассажирские пусть 
                                                      # нечетные id - товарные
  size = if type == types[1]
           rand(1..100)                               # товарные поезда - до 100 вагонов
         else
           rand(1..12)
         end
  trains.push(Train.new(id, type, size))
end

def print_trains(arr, banner)
  puts "\nСписок #{banner}\n#{'-' * 50}"
  arr.each { |train| puts format('%3d %-10s %3d %-20s', train.number, train.type, train.size, train) }
end
# найти в массиве объектов класса Train
# объект по номеру (id) поезда
def find_train(objs_arr, attr_value )
  objs_arr.detect {|e| e.number == attr_value }
end


# ---------------------------------------------------------
# - [x] Имеет название, которое указывается при ее создании
#
# Список станций читается из файла
#
require  'yaml'
db = "/home/berezin/courses/ruby_course_thinknetica/Part_4._Fundamentals_of_OOP_in_Ruby/railway_management/src/db/dvzd.yaml"
stations = []
for name in YAML.load_file( "#{db}").fetch("stations").keys do
  stations << Station.new( name )
end
#p "\n#{'-' * 50}\n"
#stations.each { |i| p i }



# найти в массиве объектов класса Station 
# объект по названию станции
def find_station(objs_arr, attr_value )
  objs_arr.detect {|e| e.name == attr_value }
end

#p "#{'-' * 50}"
#p find_station(stations, "Ласточка")
#p find_station(stations, "Угольная")

# ---------------------------------------------------------
# - [x] Может принимать поезда (по одному за раз)
#
ugolnaya    = find_station(stations, "Угольная")
vladivostok = find_station(stations, "Владивосток")

ugolnaya.take_train( find_train(trains, 101) )   # станция Угольная принимает поезд номер 101
ugolnaya.take_train( find_train(trains, 100) )   # станция Угольная принимает поезд номер 100
ugolnaya.take_train( find_train(trains, 105) )   # станция Угольная принимает поезд номер 105

# ---------------------------------------------------------
# - [x] Может возвращать список всех поездов на станции, находящиеся в текущий момент
puts "\nПоезда на станции Угольная"
p "#{'-' * 50}"
ugolnaya.trains.each { |i| p i }

# ---------------------------------------------------------
# - [x] Может возвращать список поездов на станции по типу (см. ниже): кол-во грузовых, пассажирских
#
types.each do |typ|
  puts "\nСтанция #{ugolnaya.name}. #{typ.capitalize} поезда: "
  p "#{'-' * 50}"
  ugolnaya.trains(typ).each { |i| p i }
end

# ---------------------------------------------------------
# - [x] Может отправлять поезда (по одному за раз, при этом, поезд удаляется из списка поездов,
#       находящихся на станции).
#
send_train_number = 100
puts "\nСо станции #{ugolnaya.name} оправляется поезд #{send_train_number} "
p "#{'-' * 50}"
ugolnaya.send_train( find_train(trains, send_train_number) )   # со станции Угольная отправлен поезд номер 100
p find_train(trains, send_train_number) 
puts "\nПоезда на станции Угольная"
p "#{'-' * 50}"
ugolnaya.trains.each { |i| p i }
