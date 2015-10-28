require "pry"

class Blog
	def initialize
		@current_page = 0
		@posts = []
	end

	def add_post(post)
		@posts.push(post)
	end

	def order_by_date
		@posts = @posts.sort do |post1,post2|
			post2.date <=> post1.date
		end
	end

	def create_front_page
		order_by_date
		publish_front_page
	end

	def publish_front_page
		page = @posts.each_slice(3).to_a
			page[@current_page].each do |post|
					if post.sponsored == "y"
						puts "***** #{post.title} ******" + post.text
					else
						puts post.title + post.text
					end
			end
		puts "************"
		puts " 1    2     3  next or previous?"
		choice = gets.chomp
		select_next_action(choice)
	end	

	def select_next_action(choice)
		if choice.downcase == "next"
			system"clear"
			@current_page = @current_page +1
			publish_front_page
		elsif choice.downcase == "previous"
			system"clear"
			@current_page -= 1
			publish_front_page
		end
	end
end

class Post
	attr_reader :title, :date, :text, :sponsored
	def initialize(title, date, text, sponsored)
		@title = title
		@date = date
		@text = text
		@sponsored = sponsored
	end
end

blog = Blog.new
blog.add_post Post.new("Uno ", "08/25/2015", "blabla", "0")
blog.add_post Post.new("Dos ", "08/30/2015", "blabla", "0")
blog.add_post Post.new("Tres ", "08/31/2015", "blabla", "0")
blog.add_post Post.new("Cuarto ", "05/05/2015", " blabla", "y")
blog.add_post Post.new("Cinco ", "05/05/2015", "blabla", "0")
blog.add_post Post.new("Seis ", "05/05/2015", "blabla", "0")
blog.add_post Post.new("Siete ", "05/05/2015", "blabla", "0")
blog.add_post Post.new("Ocho ", "05/05/2015", "blabla", "0")

blog.create_front_page
