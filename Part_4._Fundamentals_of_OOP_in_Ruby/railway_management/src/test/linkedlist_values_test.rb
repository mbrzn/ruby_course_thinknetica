puts 'Old pwd: ' +  Dir.pwd;  puts "... -> ..."
Dir.chdir( 'Part_4._Fundamentals_of_OOP_in_Ruby/railway_management/src' )
puts "New pwd: " + Dir.pwd;   puts "\n"

require_relative "main/linkedlist.rb"
require_relative "main/station.rb"

=begin
wd = '/home/berezin/courses/ruby_course_thinknetica/Part_4._Fundamentals_of_OOP_in_Ruby/railway_management'
# puts "#{wd}/main/train"
require_relative "#{wd}/src/main/linkedlist"
require_relative "#{wd}/src/main/station"
=end

list = LinkedList.new
puts "#{'-' * 20}"
list.append("A")
list.append(20)
list.append("D")
#list.append(Station.new("Шмаковка"))
shmakovka = Station.new("Шмаковка")
list.append( shmakovka )
list.append("Z")
list.print

puts "\n#{'-' * 20}"
list.append_after(1, 15)
list.append_after(20, 25)
list.print

puts "\n#{'-' * 20}"
p shmakovka.next.class
p list.find( shmakovka ).class
p shmakovka
p list.find( shmakovka ) 
p shmakovka.object_id
p list.find( shmakovka.name ).object_id 

