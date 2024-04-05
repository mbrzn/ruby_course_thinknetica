# Класс Route (Маршрут):
#
# -[x] Имеет начальную и конечную станцию, а также
# -[x] список промежуточных станций. Начальная и конечная станции указываются при
#      создании маршрута, а промежуточные могут добавляться между ними.
# -[x] Может добавлять промежуточную станцию в список
# -[x] Может удалять промежуточную станцию из списка
# -[x] Может выводить список всех станций по-порядку от начальной до конечной
#
class Route < LinkedList
#class Route
  alias :first :head 
  alias :last :find_tail 
  def initialize(beginig_station_name,ending_station_name)
    #super()
    #@list = LinkedList.new
    super()
    #super()                                   # наследуется конструктор родительского класса
                                              # !: синтаксис super без () ошибочен -
                                              #    без скобок все аргументы дочернего ininitialize 
                                              #    передаются в parent ininitialize автоматически,
                                              #    что интерпретатор запрещает, ибо запутывает его
    #@list.append(beginig_station_name)
    self.append(beginig_station_name)
    #@list.append(ending_station_name)
    self.append(ending_station_name)
=begin
    @first = beginig_station_name
    beginig_station_name.next = ending_station_name
    #puts "DEBUG Route"
=end
  end
end

# - [ ] Переопределить дочерний метод *удалить узел* так, чтобы маршрут
#       содержал не менее двух станций

