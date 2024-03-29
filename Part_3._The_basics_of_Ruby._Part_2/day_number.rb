# Заданы три числа, которые обозначают число, месяц, год
# (запрашиваем у пользователя).
# Найти порядковый номер даты, начиная отсчет с начала года.
# Учесть, что год может быть високосным. (Запрещено использовать встроенные
# в ruby методы для этого вроде Date#yday или Date#leap?)
# Алгоритм опредления високосного года: docs.microsoft.com
#
#
def parser_3_number(str)
  # допустимые разделители аргументов
  separators = [',', '#', ' ', '-', ';', ':']
  separators.each do |separator|
    list = str.split(separator)
    next unless list.size == 3

    # подходящий разделить трех чисел найден
    list.map! { |i| i.to_i }
    # puts "Аргументы программы:#{list}"
    return list
  end
  # ни один разделитель не соответствует тройке чисел
  abort "ERROR. Число аргументов не равно трем: #{list}"
end

print "\nОпределитель числа дней с начала года.\nВведите год, месяц и день: "
str = gets.chomp
args = parser_3_number(str) # конвертировать строку в массив трех чисел
y_in = args[0]
d_in = args[2]
m_in = args[1]

monthes = [31, 28, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31]
is_leap = (y_in % 4).zero? && (y_in % 100) != 0 || (y_in % 400).zero?
monthes[1] = 29 if is_leap

# сложить все дни предыдущиx месяцев года и дни текущего месяца
day_count = 0
(0..m_in - 2).each { |month| day_count += monthes[month] unless m_in == 0 }
day_count += d_in
puts "\nДень #{Time.mktime(y_in, m_in, d_in).strftime('%b %e %Y')} - это #{day_count} день #{y_in} года"

# Вариант 2
# puts "Это #{days[0...m_in-1].sum + day} день в году"

# Debug
# puts Time.mktime(y_in, m_in, d_in).yday
