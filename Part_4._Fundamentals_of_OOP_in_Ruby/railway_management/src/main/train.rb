# Класс Train (Поезд):
#
# - [x] Имеет номер (произвольная строка) и
# - [x] тип (грузовой, пассажирский) и
# - [x] количество вагонов, эти данные указываются при создании экземпляра класса
# - [x] Может набирать скорость
# - [x] Может возвращать текущую скорость
# - [x] Может тормозить (сбрасывать скорость до нуля)
# - [x] Может возвращать количество вагонов
# - [x] Может прицеплять/отцеплять вагоны (по одному вагону за операцию, метод просто увеличивает
#       или уменьшает количество вагонов). Прицепка/отцепка вагонов может осуществляться только
#       если поезд не движется.
# - [x] Может принимать маршрут следования (объект класса Route).
# - [x] При назначении маршрута поезду, поезд автоматически помещается на первую станцию в маршруте.
# - [x] Может перемещаться между станциями, указанными в маршруте. Перемещение возможно
#       вперед и назад, но только на 1 станцию за раз.
# - [x] Возвращать предыдущую станцию, текущую, следующую, на основе маршрута

class Train
  attr_reader :number, :type, :size, :station, :speed
  attr_accessor :route
  def initialize( id, type, size = nil, route = nil )
    @number = id                        # номер (number) поезда
    @type = type
    @size = if size.nil?
              1
            else
              size.to_i
            end
    @route = if route.nil?
              nil
            else
              @route = route
              @station = route.first    # если route = nil, то route.nil = ERROR
            end
    @speed = 0.to_f
  end
  def route=( route )
    @route = route
    @station = route.first 
  end
  def forward
    @station = @station.next
  end
  def back
    @station = route.find_before(station.name)
  end
  def speed_increase( delta )
    @speed += delta
  end
  def speed_decrease( delta )
    @speed -= delta
    @speed = 0.0 if @speed < 0.0
  end
  def size_increase
    speed == 0.0 ? (@size += 1) : size
  end
  def size_decrease
    speed == 0.0 && size > 1 ? (@size -= 1) : size
  end
  def station_next
    self.station.next
  end
  def station_before
    route.find_before( station.name )
  end
=begin
=end
end
