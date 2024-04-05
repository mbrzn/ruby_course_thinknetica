class LinkedList
  attr_reader   :head
  alias :first :head 
  attr_reader  :find_tail
  alias :last :find_tail 
  def initialize
    @head = nil
  end

  def append(new_node)
    if @head
      find_tail.next = new_node
    else
      @head = new_node
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


  def append_after(target_value_of_node,  new_node )       # Найти узел со значением target
                                        # вставить после него новый со значением value
    node = find(target_value_of_node)
    return unless node                  # узел со значением target не найден

    old_next       = node.next          #  узел со значением target найден
    node.next      = new_node
    node.next.next = old_next           #  новый узел получает указатель на old_next
  end


  def find( value_of_node )
    node = @head
    return false unless node.next         # тоже, что и
                                          # if node.next.nil? == true
                                          #   return false    
                                          # end
                                          # в списке только один узел (действительный 
                                          # или возможный)
    return node  if node.value == value_of_node

    while (node = node.next)              # выражение в скобках, кажется, lisp-функция
                                          # true, если функция действительна и
                                          # false, если функция - только возможность
      return node if node.value == value_of_node
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

  def delete(value_of_node)
    if @head.value == value_of_node           # это первый узел списка
      old_head = @head
      @head = @head.next
      old_head.next = nil
      return
    end
    node_being_deleted = find ( value_of_node )
    node      = find_before(value_of_node)    # узел value - не первый
                                      # найти узел, предшествующий удаляемому
    node.next = node.next.next        # найти узел последующий за удаляемым
                                      # связать предшествующий и последующий 
                                      # непосредственно
    node_being_deleted.next = nil
  end

  def find_before(value_of_node)
    node = @head
    return false unless node.next     # узел head - единственный в списке 
                                      # 
                                      # первый узел списка - предпоследний 
    return node  if node.next.value == value_of_node

    while (node = node.next)          # - [x] первый узел списка - не предпоследний
                                      # Является ли предпоследним второй узел?
                                      # - [x] второй узел - не последний И
                                      # - [x] третий узел имеет значение равное искомому, значит 
                                      # - [x] второй узел - предпоследний  
      return node if node.next && node.next.value == value_of_node
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
  alias :n :value

  def initialize(value)
    @value = value
    @next  = nil
  end

  def to_s
    "Node with value: #{@value}"
  end
end
