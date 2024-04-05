puts 'Old pwd: ' +  Dir.pwd;  puts "... -> ..."
Dir.chdir( 'Part_4._Fundamentals_of_OOP_in_Ruby/railway_management/src' )
puts "New pwd: " + Dir.pwd;   puts "\n"

#require_relative "main/linkedlist.rb"
require_relative "main/ll2.rb"
require_relative "main/station.rb"

=begin
wd = '/home/berezin/courses/ruby_course_thinknetica/Part_4._Fundamentals_of_OOP_in_Ruby/railway_management'
# puts "#{wd}/main/train"
require_relative "#{wd}/src/main/linkedlist"
require_relative "#{wd}/src/main/station"
=end

vl = Node.new( "vl" )
ugl = Node.new( "ugl" )
pr = Node.new( "1r" )
uss = Node.new( "uss" )
rt = LinkedList.new
rt.append( vl )
rt.append( pr )
rt.append( ugl )
rt.append( uss )


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
