require "pry"

module Camera
	def make_photo
		puts "Photo taken in #{os}"
	end
end


class Device
	attr_reader :os, :screen, :print
	def initialize(os, screen, print)
		@os = os
		@screen = screen
		@print = print
	end
end

class Phone < Device
	include Camera
	def initialize(os, screen, print, agenda)
		super(os, screen, print)
		@agenda = agenda
	end

	def show_time
		time = Time.now
		puts time
	end

	def call(contact)
		@agenda.call(contact)
	end
end

class Agenda
	def initialize
		@contacts = []
	end

	def add_contact(contact)
		@contacts.push(contact)
	end

	def show_contacts
		@contacts.each do |contact|
			puts "Contact " + contact
		end
	end

	def call(contact)
		puts contact + " calling"
	end
end


class SmartWatch < Device
	attr_reader :os, :screen, :print
	include Camera
	def initialize(os, screen, print)
		super(os, screen, print)
	end

	def show_time
		time = Time.now
		puts "*** #{time} ***"
	end	
end

class Laptop < Device
	def initialize(os, screen, print)
		super(os, screen, print)
	end

	def show_time
		time = Time.now
		puts time
	end
end

class Microwave < Device
	def initialize()
	end

	def heat_food
		puts "Woow thats hot"
	end

	def show_time
		time = Time.now
		puts time
	end
end


agenda = Agenda.new
iphone = Phone.new("iOS", "5", "yes", agenda)
iswatch = SmartWatch.new("iOS", "2", "no")

pepe = agenda.add_contact("pepe")
juan = agenda.add_contact("juan")

iphone.call("pepe")
agenda.show_contacts

hours = [Phone.new("android", "5", "yes", "agenda"), SmartWatch.new("android", "5", "yes"), Laptop.new("android", "5", "yes"), Microwave.new()]
hours.each do |device|
	puts device.show_time
end
