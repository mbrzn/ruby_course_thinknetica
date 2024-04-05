# - [ ] тест класса Train
#
#wd = '/home/berezin/courses/ruby_course_thinknetica/Part_4._Fundamentals_of_OOP_in_Ruby/railway_management'
#require_relative "#{wd}/src/main/station"
#require_relative "#{wd}/src/main/train"

puts 'Old pwd: ' +  Dir.pwd;  puts "... -> ..."
#Dir.chdir(wd)
Dir.chdir( 'Part_4._Fundamentals_of_OOP_in_Ruby/railway_management/src' )
puts "New pwd: " + Dir.pwd;   puts "\n"

require_relative "main/linkedlist.rb"
require_relative "main/route.rb"
require_relative "main/station.rb"
require_relative "main/train.rb"


#------------------------------------------------------------------
# - [x] Имеет номер (произвольная строка) и
# - [x] тип (грузовой, пассажирский) и
# - [x] количество вагонов, эти данные указываются при создании экземпляра класса
#
#
types = %i[passenger freight]                         # типология поездов
trains = []

100.upto(109) do |id|                                 # создать массив из 10 поездов
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


puts "\nМножество поездов Дальневосточно железной дороги\n#{'-' * 50}"
trains.each { |i| p i }



#------------------------------------------------------------------
# - [x] Может возвращать количество вагонов
puts "\nНомер поезда и число вагонов в нем\n#{'-' * 50}"
trains.each { |i| puts "#{i.number}\t#{i.size}" }


#------------------------------------------------------------------
# - [x] Может принимать маршрут следования (объект класса Route).
# - [x] При назначении маршрута поезду, поезд автоматически помещается на первую станцию в маршруте.

# заготовка станций и маршрутов
# Список станций читается из файла
#
require  'yaml'
db = "/home/berezin/courses/ruby_course_thinknetica/Part_4._Fundamentals_of_OOP_in_Ruby/railway_management/src/db/dvzd.yaml"
stations = []
for name in YAML.load_file( "#{db}").fetch("stations").keys do
  stations << Station.new( name )
end
puts "\nСтанции в возможности\n#{'-' * 50}\n"
stations.each { |i| p i }

# найти в массиве объектов класса Station 
# объект по названию станции
def find_station(objs_arr, attr_value )
  objs_arr.detect {|e| e.name == attr_value }
end

vladivostok = find_station(stations, "Владивосток")
shmakovka = find_station(stations, "Шмаковка")
#route = Route.new( vladivostok, shmakovka )
route = Route.new( stations[0], stations[1] )
stations[2..-1].map { |station| route.append( station )}
=begin
ugolnaya    = find_station(stations, "Угольная")
route.append_after( vladivostok, ugolnaya )             # станция из несвязанного множества включена в маршрут
ussuriysk = find_station(stations, "Уссурийск")
route.append_after( ugolnaya, ussuriysk )               # станция из несвязанного множества включена в маршрут
sibirtsevo = find_station(stations, "Сибирцево")
route.append_after( ussuriysk, sibirtsevo )               # станция из несвязанного множества включена в маршрут
=end

puts "\nМаршрут составлен из станций:"; puts "#{'-' * 50}"
route.print; puts "\n"

t100 = find_train( trains , 100 )                       # переменная t100 ссылается на объект *поезд номер 100*
t100.route = route                                      # поезд номер 100 поставлен на маршрут route
puts "\nНа маршрут поставлен поезд"; puts "#{'-' * 50}"
p t100
p t100.route
puts "поезд #{t100.number} расположен на станции #{t100.station.name}"

t107 = find_train( trains , 107 )                       # переменная t107 ссылается на объект *поезд номер 107*
t107.route = route                                      # поезд номер 107 поставлен на маршрут route
puts "\nНа маршрут поставлен поезд"; puts "#{'-' * 50}"
p t107
p t107.route
puts "поезд #{t107.number} расположен на станции #{t107.station.name}"


#------------------------------------------------------------------
# - [ ] Может перемещаться между станциями, указанными в маршруте. Перемещение возможно
#       вперед и назад, но только на 1 станцию за раз.
#
puts "\nОтправить поезд на следующую станцию"; puts "#{'-' * 50}"
print "поезд номер #{t100.number} со станции "
p t100.station
t100.forward
print "отправлен на станцию "
p t100.station


# - [x] Может набирать скорость
# - [x] Может возвращать текущую скорость
# - [x] Может тормозить (сбрасывать скорость до нуля)
#
puts "\nИзменить скорость поезда: "; puts "#{'-' * 50}"
puts "#{t100.speed}"
t100.speed_increase( 20 );    puts "#{t100.speed}"
t100.speed_decrease( 10 );    puts "#{t100.speed}"
t100.speed_decrease( 10 );    puts "#{t100.speed}"
t100.speed_decrease( 10 );    puts "#{t100.speed}"

# - [x] Может прицеплять/отцеплять вагоны (по одному вагону за операцию, метод просто увеличивает
#       или уменьшает количество вагонов). Прицепка/отцепка вагонов может осуществляться только
#       если поезд не движется.
puts "\nИзменить число вагонов поезда:"; puts "#{'-' * 50}"
puts "Поезд номер: #{t100.number}, скорость: #{t100.speed}, вагонов: #{t100.size}"
t100.size_increase;    print "Уменьшаем число вагонов: #{t100.size}"
1.upto(20) { t100.size_decrease;  print "->#{t100.size}" }
puts  


t107.speed_increase( 20 )
puts "\nИзменить число вагонов поезда:"; puts "#{'-' * 50}"
puts "Поезд номер: #{t107.number}, скорость: #{t107.speed}, вагонов: #{t107.size}"
t107.size_increase;    print "Уменьшаем число вагонов: #{t107.size}"
1.upto(20) { t107.size_decrease;  print "->#{t107.size}" }
puts  


# - [x] Возвращать предыдущую станцию, текущую, следующую, на основе маршрута
#
def where_is_train( train )
  puts "\nПоложение поезда номер #{train.number} на маршруте #{train.route.first.name}-#{train.route.last.name}:"
  puts format('  %-18s %s', "станция нахождения ", train.station.name )
  puts format('  %-18s %s', "предыдущая станция ", train.station_before.name)
  puts format('  %-18s %s', "следующая станция ", train.station_next.name)
end

puts "\n#{'-' * 50}"
where_is_train ( t100 );    puts


# - [x] Может перемещаться между станциями, указанными в маршруте. Перемещение возможно
#       вперед и назад, но только на 1 станцию за раз.
n = 3
puts "\nПереместиться вперед #{n} раз(а) #{'-' * 50}"
1.upto(n) { t100.forward }
where_is_train ( t100 );    puts

puts "\nПереместиться назад #{n} раз(а) #{'-' * 50}"
1.upto(n) { t100.back }
where_is_train ( t100 );    puts
