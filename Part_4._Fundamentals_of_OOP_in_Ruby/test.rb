require_relative 'dialog' 
 
hello = Dialog.new 
hello.hello  # Hello, world!
str = hello.mygets
hello.myputs(str)

