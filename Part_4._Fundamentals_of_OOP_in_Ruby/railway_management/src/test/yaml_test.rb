require  'yaml'
db = "/home/berezin/courses/ruby_course_thinknetica/Part_4._Fundamentals_of_OOP_in_Ruby/railway_management/src/db/dvzd.yaml"

# [Фултон. 2016. *Путь Ruby*](zotero://select/items/_E52VD36B) стр. 323
#
Person  =  Struct.new(:name) 

puts  YAML.dump("Hello,  world.")
puts  YAML.dump(
  { this:  "is  а  hash",
    with:  "symbol  keys  and  string  values"}
)
puts  YAML.dump([1,  2,  3])
puts  YAML.dump  Person.new("Alice")

# Вывести базу данных из yaml файла
#
#p YAML.load_file( "#{db}") 

structure = YAML.load_file( "#{db}") 
p structure.fetch("stations").keys 



