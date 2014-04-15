require 'sinatra'

get "/Error" do
	"Error"
end

get "/" do 
	"Hello!"
end

get "/fav_things" do
	@fav_things = FavThing.fav_things
	erb :"fav_things/index"
end

post "/fav_things" do
	text = params[:description]
	if FavThing.add_to_do(text)
		redirect "/fav_things"
	else
		redirect "/Error"
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