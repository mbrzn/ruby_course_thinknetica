# Сумма покупок.
#
# Пользователь вводит поочередно
# - название товара,
# - цену за единицу и
# - кол-во купленного товара (может быть нецелым числом).
#
# Пользователь может ввести произвольное кол-во товаров до тех пор,
# пока не введет "стоп" в качестве названия товара.
#
# На основе введенных данных требуетеся:
#
# - Заполнить и вывести на экран хеш,
#   - ключами которого являются названия товаров, а
#   - значением - вложенный хеш, содержащий
#     - цену за единицу товара и
#     - кол-во купленного товара.
# - Также вывести итоговую сумму за каждый товар.
# - Вычислить и вывести на экран итоговую сумму всех покупок в "корзине".
#
#
def parser_3_args(str)
  # допустимые разделители аргументов
  separators = [',', '#', ' ', '-', ';', ':']
  separators.each do |separator|
    list = str.split(separator)
    next unless list.size == 3

    # подходящий разделить трех чисел найден
    list.map! { |i| i }
    # puts "Аргументы программы:#{list}"
    return list
  end
  # ни один разделитель не соответствует тройке чисел
  abort "ERROR. Число аргументов не равно трем: #{list}"
end

# суммирование покупок
def amount_of_purchases(basket)
  puts "#{basket}"
  amount = 0
  puts "\nСумма покупок\n#{'-' * 40}"
  basket.to_a.map do |product|
    cost = product[1][0] * product[1][1]
    amount += cost
    puts "#{product[0]}: #{product[1][0]} * #{product[1][1]} = #{cost}"
  end
  puts "Итого: #{amount}"
  abort 'BYE'
end

basket = {}
print "\nКорзина для товаров.\nВведите название товара, цену за единицу и кол-во купленного товара\n"
loop do
  print ':'
  str = gets.chomp
  args = parser_3_args(str) # конвертировать строку в массив: строка, число, число
  basket[args[0]] = [args[1].to_f, args[2].to_f]
  if /(стоп|stop)/ =~ args[0]
    basket.delete(args[0])
    amount_of_purchases(basket)
  end
  puts "\t#{basket}"
end
