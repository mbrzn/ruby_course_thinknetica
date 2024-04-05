class LinkedList
  def initialize
    @head = nil
  end

  def append(value)
    if @head
      find_tail.next = Node.new(value)
    else
      @head = Node.new(value)
    end
  end

=begin
  def find_tail
    node = @head
    while !node.next.nil? do
      node = node.next
    end
    p "tail node: #{node.value}"
    return node 
   end
=end
  # Этот aвторский код работоспособен, но не понятен
  # ?: unless и while как относятся ?
  def find_tail
    node = @head
    return node unless node.next          # тоже, что и
                                          # if node.next.nil? == true
                                          #   return @head
                                          # end
                                          # в списке только один узел (действительный 
                                          # или возможный)

=begin
    # ? как работает этот авторский код?
    # - [ ] Разобраться...
    #
    return node unless node.next while (node = node.next)
=end

    while ( !node.next.nil? && node = node.next )
      # выражение в ( ) здесь - это аналог lisp фунции, см. комментарий ниже
      #
      # проверка: узел - последний?
      # если "да" - последний,
      # то операция `node = node.next` интерпретатором
      # игнорируется, ведь она логически не обязательнa 
	  end
    return node
  end


  def append_after(target, value)       # Найти узел со значением target
                                        # вставить после него новый со значением value
    node = find(target)
    return unless node                  # узел со значением target не найден

    old_next       = node.next          #  узел со значением target найден
    node.next      = Node.new(value)
    node.next.next = old_next           #  новый узел получает указатель на old_next
  end


  def find(value)
    node = @head
    return false unless node.next         # тоже, что и
                                          # if node.next.nil? == true
                                          #   return false    
                                          # end
                                          # в списке только один узел (действительный 
                                          # или возможный)
    return node  if node.value == value

    while (node = node.next)              # выражение в скобках, кажется, lisp-функция
                                          # true, если функция действительна и
                                          # false, если функция - только возможность
      return node if node.value == value
    end
  end
=begin
#   Взгляд на lisp-функцию со стороны операционной системы: 

    while (node = node.next)
      # цикл выполняется пока метод "=" возвращает true, т.е. есть что присваивать:
      # здесь присваивается адрес ОБЪЕКТа. "Адрес есть" означает, что объект наличествует
      # в оперативной памяти (имеет адрес в ней, прописан в ней)
      return node if node.value == value
    end
=end

  def delete(value)
    if @head.value == value           # это первый узел списка
      @head = @head.next
      return
    end
    node      = find_before(value)    # узел value - не первый
                                      # найти узел, предшествующий удаляемому
    node.next = node.next.next        # найти узел последующий за удаляемым
                                      # связать предшествующий и последующий 
                                      # непосредственно
  end

  def find_before(value)
    node = @head
    return false unless node.next     # узел head - единственный в списке 
                                      # 
                                      # первый узел списка - предпоследний 
    return node  if node.next.value == value

    while (node = node.next)          # - [x] первый узел списка - не предпоследний
                                      # Является ли предпоследним второй узел?
                                      # - [x] второй узел - не последний И
                                      # - [x] третий узел имеет значение равное искомому, значит 
                                      # - [x] второй узел - предпоследний  
      return node if node.next && node.next.value == value
    end
  end

  def print
    node = @head
    puts node
    # - [ ] интерференция, самоповтор баннера узла
    while (node = node.next)
      puts node
    end
  end
end

class Node
  attr_accessor :next
  attr_reader   :value

  def initialize(value)
    @value = value
    @next  = nil
  end

  def to_s
    "Node with value: #{@value}"
  end
end
