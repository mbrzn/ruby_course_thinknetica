# Заполнить массив числами фибоначчи до 100
fibonacci = [0, 1]
fibonacci.push(fibonacci[-1] + fibonacci[-2]) while fibonacci[-1] < 100
fibonacci.pop
puts "#{fibonacci}"
