def f_t
  a = [ 1, 2, 3, 4 , nil ]
  i = 0
  
  while a[i] != nil do
    i+=1
  end
  return i
end
def f_t_r(pos)
  a = [ 1, 2, 3, 4 , nil ]
  if a[pos] == nil
    p "#{a[pos]} == nil"
  else
    p "#{a[pos]} != nil"
    f_t_r(pos+1)
  end
end
