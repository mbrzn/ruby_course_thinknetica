# Прямоугольный треугольник. 
# Программа запрашивает у пользователя 3 стороны треугольника и определяет, 
# является ли треугольник 
# - прямоугольным (используя теорему Пифагора www-formula.ru), 
# - равнобедренным (т.е. у него равны любые 2 стороны) или 
# - равносторонним (все 3 стороны равны) и 
# выводит результат на экран. 
#
# Подсказка: чтобы воспользоваться теоремой Пифагора, нужно сначала найти 
# самую длинную сторону (гипотенуза) и сравнить ее значение в квадрате с суммой
# квадратов двух остальных сторон. Если все 3 стороны равны, то треугольник 
# равнобедренный и равносторонний, но не прямоугольный.

def parser_3_number(str)
  # допустимые разделители аргументов
  separators = [ ",", "#", " ", "-", ";", ":" ]
  separators.each do |separator| 
    list = str.split(separator)
    if list.size == 3 
      # подходящий разделить трех чисел найден
      list.map! { |i| i.to_f }
      puts "#{list}"
      return list
    end
  end
  # ни один разделитель не соответствует тройке чисел
  abort "ERROR. Число аргументов не равно трем: #{list}"
end

print "\nОпределитель треугольника по трем сторонам.\nВведите три числа: "
str = gets.chomp
sides = parser_3_number(str)	# конвертировать строку в массив трех чисел


# определитель треугольника по длинам сторон
# возвращает хэш качеств треугольника
#
def triangle_determinant(sides)
  triangle_type = { equilateral: false, isosceles: false, rightangled: false }
  sides.sort!				# длиннейшую сторону в конец массива 
  # возможен треугольник?
  if sides[0] + sides[1] > sides[2]
    # равносторонний? 
    triangle_type[:equilateral] = true if \
      sides[0] == sides[1] && sides[0] == sides[2]
    # равнобедренный?
    triangle_type[:isosceles] = true if \
      sides[0] == sides[1] || sides[0] == sides[2] || sides[1] == sides[2] 
    # прямоугольный?
    triangle_type[:rightangled] = true if \
      sides[0]**2 + sides[1]**2 == sides[2]**2
    return triangle_type
  # треугольник не возможен
  else
    abort "ERROR. Треугольник с такими сторонами невозможен."
  end
end

puts "Тип треугольника: #{triangle_determinant(sides)}"

