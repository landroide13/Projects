
require 'pp'
require_relative 'product'

product = Product.new

loop do
   puts "Hello do you want add some Products ? (y/n)"
   answer = gets.chomp

   if answer! = "y"
      puts "Ok , bye"
      break
   end

   puts "Enter the name"
   product.name = gets.chomp

   puts "Enter the quantity"
   product.quan = gets.chomp

   puts "Enter the price"
   product.price = gets.chomp

   puts "You product looks ..."

   pp product

  loop do
   puts "Do you wanna save it ? (y/n)"
    answer = gets.chomp

    if answer! = "n"
       product.save
       puts "Have been save..."
      break
    end
      puts "Ok , lets back"
  end
end
