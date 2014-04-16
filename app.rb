require 'sinatra'
require 'sinatra/activerecord'

set :database, "sqlite3:///fav_things_app.db"

get "fav_things/error" do
	erb :"fav_things/error"
end

get "/fav_things" do 
	erb :"fav_things/index"
end

get "/fav_things/index" do
	erb :"fav_things/index"
end

get "/fav_things/new" do
	@fav_things = FavThing.all
	erb :"fav_things/new"
end

post "/fav_things/new" do
	@fav_thing = FavThing.new(params[:author_name])
	if @fav_thing.check_if_valid
		@fav_thing.save
		redirect "/fav_things/new"
	else
		redirect "/fav_things/error"
	end
end


put "/fav_things/:id" do
	@fav_thing = FavThing.find(params[:id])
	if @fav_thing.update_attributes(params[:fav_thing])
		redirect "/fav_things/new"
	else
		redirect "/fav_things/error"
	end
end

get "/fav_things/:id/edit" do
	@fav_thing = FavThing.find(params[:id])
	erb :"fav_things/edit"
end




get "/fav_things/:id" do
	@fav_thing = FavThing.find(params[:id])
	erb :"fav_things/show"
end

delete "/fav_things/:id" do 
	@fav_thing = FavThing.find(params[:id])
	if @fav_thing.delete
		redirect "/fav_things/new"
	else
		redirect "/fav_things/index"
	end
end


class FavThing < ActiveRecord::Base

	def check_if_valid
	end
	# @@fav_things = ["Terry Pratchett", "Kurt Vonnegut","Neil Gaiman", "JK Rowling", "JRR Tolkien"]


	# def self.fav_things
	# 	@@fav_things
	# end

	# def self.add_fav_thing(fav_thing)
	# 	if fav_thing == "I never read"
	# 		return false
	# 	else
	# 		@@fav_things.push(fav_thing)
	# 		# @@fav_things << fav_thing
	# 	end
	# end

end