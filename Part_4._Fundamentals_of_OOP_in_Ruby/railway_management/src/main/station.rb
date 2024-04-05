# Класс Station (Станция):
#
# - [x] Имеет название, которое указывается при ее создании
# - [x] Может принимать поезда (по одному за раз)
# - [x] Может возвращать список всех поездов на станции, находящиеся в текущий момент
# - [x] Может возвращать список поездов на станции по типу (см. ниже): кол-во грузовых, пассажирских
# - [x] Может отправлять поезда (по одному за раз, при этом, поезд удаляется из списка поездов,
#       находящихся на станции).
# - [x]
#
class Station < Node 
  attr_reader :name, :trains
  alias :name :value

  def initialize(name)
    #@name = name
    super name                        # наследуется конструктор родительского класса
                                      # которому передается аргумент name
    @trains = []
  end

  def trains(type = nil)
    if type.nil?
      @trains
    else
      @trains.select { |train| train.type == type }
    end
  end

  def take_train(train)
    @trains.push(train)
  end

  def send_train(train)
    @trains.delete_if { |item| item == train }
  end
end
