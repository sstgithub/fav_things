require 'sinatra'

get "/error" do
	erb :"fav_things/error"
end

get "/" do 
	erb :"fav_things/index"
end

get "/index" do
	erb :"fav_things/index"
end

get "/new" do
	@fav_things = FavThing.fav_things
	erb :"fav_things/new"
end

post "/new" do
	text = params[:description]
	if FavThing.add_to_do(text)
		redirect "/new"
	else
		redirect "/error"
	end
end


class FavThing
	@@fav_things = ["Terry Pratchett", "Kurt Vonnegut","Neil Gaiman", "JK Rowling", "JRR Tolkien"]

	def initialize
	end

	def self.fav_things
		@@fav_things
	end

	def self.add_to_do(fav_thing)
		if fav_thing == "I don't read"
			return false
		else
			@@fav_things.push(fav_thing)
			# @@fav_things << fav_thing
		end
	end

end

# RACK_ENV=production rackup config.ru # puts it into production environment for Sinatra