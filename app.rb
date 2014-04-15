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
	if FavThing.add_fav_thing(text)
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

	def self.add_fav_thing(fav_thing)
		if fav_thing == "I never read"
			return false
		else
			@@fav_things.push(fav_thing)
			# @@fav_things << fav_thing
		end
	end

end