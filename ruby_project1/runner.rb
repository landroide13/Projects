
require 'pp'
require_relative 'user'

user=User.new

loop do

puts "Hello do u want add some contacts? (y/n) "
answer=gets.chomp

if answer!="y"
  puts "OK , bye"
  break
end

puts "Enter a name"
user.name=gets.chomp

puts "Now , enter a email"
user.email=gets.chomp

puts "Contact added ¡¡!! "
pp user

user.save

end

#user=User.new 'pete@petardas.com','pete'

#pp user

#user.save
