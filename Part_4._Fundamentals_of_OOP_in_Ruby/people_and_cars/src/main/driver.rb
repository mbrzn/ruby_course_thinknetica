# ./driver.rb

class Driver
  attr_reader :name, :cars
  def initialize(name)
    @name = name
    @cars = []
  end

  def buy_car(car)
    @cars << car  # car внутри Driver ?
    # у водителя есть не car, а
    # право, согласие других
    # водителей на то, чтобы водитель писал 
    # свое имя на двери конкретно этой машины
    car.change_door_title(self)
  end
end
