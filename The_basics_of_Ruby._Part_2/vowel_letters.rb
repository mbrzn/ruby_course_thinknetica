# Заполнить хеш гласными буквами, где значением будет являтся
# порядковый номер буквы в алфавите (a - 1).
#
h = {}
i = 0
('a'..'z').each do |letter|
  i += 1
  h[letter.to_sym] = i if /[aeiouy]/ =~ letter
end
puts h
