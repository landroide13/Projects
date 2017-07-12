require 'json'

class Product

  attr_accessor :name , :quan , :price , :type

  def initialize(*args)
    @name=args[0]
    @quan=args[1]
    @price=args[3]
    @type=Product.type_template
  end

  def self.type_template
    file=File.read 'type.json'
    JSON.load(file,nil,symbolize_name:true)
  end

  def save
    self_product={name:@name,quan:@quan,price:@price,type:@type}.to_json
    open('products.json','a') do |file|
      file.puts self_product
    end


  end


end
