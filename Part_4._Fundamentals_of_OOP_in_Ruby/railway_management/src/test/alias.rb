# Имя свойства родителя и потомка

class Parent
  attr_accessor :val
end

class Child < Parent
#  alias_method :name, :val
  alias :name= :val=
  alias :name :val
end


