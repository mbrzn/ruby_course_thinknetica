# тест класса Route
# -[x] 
#
puts 'Old pwd: ' +  Dir.pwd;  puts "... -> ..."
Dir.chdir( 'Part_4._Fundamentals_of_OOP_in_Ruby/railway_management/src' )
puts "New pwd: " + Dir.pwd;   puts "\n"

require_relative "main/linkedlist.rb"
require_relative "main/route.rb"
require_relative "main/station.rb"

# ----------------------------------------------------------
#
# Список станций читается из файла
#
require  'yaml'
db = "db/dvzd.yaml"
stations = []
for name in YAML.load_file( "#{db}").fetch("stations").keys do
  stations << Station.new( name )             # массив станций, еще не отнесенные к маршрутам
end
p "\n#{'-' * 50}\n"
stations.each { |i| p i }

# найти в массиве объектов класса Station 
# объект по названию станции
def find_station(objs_arr, attr_value )
  objs_arr.detect {|e| e.name == attr_value }
end

#ugolnaya    = find_station(stations, "Угольная")
vladivostok = find_station(stations, "Владивосток")
shmakovka = find_station(stations, "Шмаковка")

#p vladivostok
#p shmakovka

#-------------------------------------------------------------------------
#
# -[x] Имеет начальную и конечную станцию, а также
# -[x] список промежуточных станций. Начальная и конечная станции указываются при
#      создании маршрута, а промежуточные могут добавляться между ними.
#
puts "Станций в простейшем маршруте"; puts "#{'-' * 50}"
route = Route.new( vladivostok, shmakovka )
route.print; puts "\n"

#-------------------------------------------------------------------------
#
# -[x] Может добавлять промежуточную станцию в список
# -[x] Может выводить список всех станций по-порядку от начальной до конечной
#
ugolnaya    = find_station(stations, "Угольная")
route.append_after( "Владивосток" , ugolnaya )             # станция из несвязанного множества включена в маршрут
ussuriysk = find_station(stations, "Уссурийск")
route.append_after( "Угольная", ussuriysk )               # станция из несвязанного множества включена в маршрут
sibirtsevo = find_station(stations, "Сибирцево")
route.append_after( "Уссурийск", sibirtsevo )               # станция из несвязанного множества включена в маршрут

puts "В маршрут добавлены станции"; puts "#{'-' * 50}"
route.print; puts "\n"


#-------------------------------------------------------------------------
#
# -[x] Может удалять промежуточную станцию из списка
#
puts "\nУдаление станций из маршрута:"; puts "#{'-' * 50}"
%w( Угольная Уссурийск ).map do 
  |i| route.delete( i )             # станция удаляется из маршрута
  puts "Из маршрута удалена станция #{i}. Аттрибут next объекта station очищен:"
  p find_station(stations, i);      puts "\n"
end

puts "\nМаршрут состоит из:"; puts "#{'-' * 50}"
route.print; puts "\n"
