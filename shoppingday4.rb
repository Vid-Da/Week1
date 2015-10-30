
class ShoppingCart
	def initialize
		@items = []
	end

	def add_item_to_cart(item)
		@items.push(item)
	end
	
	def count(item)
		count = Hash.new(0)
		@items.each do |item|
			count[item] +=1
		end
		count.each do |k, v|
 		 puts "#{k} appears #{v} times"
		end
	end

	def show
		index = 0
		@items.each do |item|
		index = index + 1
		 puts "#{index} #{item.name} #{item.price}"
		end
	end

	def cost
		total_price = 0
		@items.each do |item|
			total_price += item.price.to_i
		end
		puts "Total price is #{total_price}"
	end
end

class Item
	attr_reader :name, :price
	def initialize(name, price)
		@name = name
		@price = price
	end
end

class Fruit < Item
end

apple = Fruit.new("apple", "10")
oranges = Fruit.new("oranges", "5")
grapes = Fruit.new("grapes", "15")
banana = Fruit.new("banana", "20")
watermelon = Fruit.new("watermelon","50")

cart = ShoppingCart.new
cart.add_item_to_cart(apple)
cart.add_item_to_cart(banana)
cart.add_item_to_cart(banana)

cart.count("banana")
cart.show
cart.cost
