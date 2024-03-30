#!/usr/bin/ruby
class Dialog
  VERY_BAD = 0
  BAD = 1
  def mygets
    gets.chomp
  end
  def myputs(arg)
    print "my_"
    puts arg
  end
  def hello
    puts "Hello!"
  end
end
