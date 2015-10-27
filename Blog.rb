class Blog
	def initialize
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
		front_page = @posts.each do |post|
			puts post.title + post.text + " " + post.date
		end
	end
end

class Post
	attr_reader :title, :date, :text
	def initialize(title, date, text)
		@title = title
		@date = date
		@text = text
	end
end

blog = Blog.new
blog.add_post Post.new("Tercera ", "08/25/2015", " Aqui estamos")
blog.add_post Post.new("Segunda ", "08/30/2015", " Este deberia ser el segundo")
blog.add_post Post.new("Primera ", "08/31/2015", " Este deberia ser el primero")

blog.publish_front_page
blog.create_front_page
