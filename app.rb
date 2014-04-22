require 'sinatra'
require 'sinatra/activerecord'

set :database, "sqlite3:///fav_things_app.db"

# shows home page

get "/fav_things/home" do
	erb :"fav_things/home"
end

#shows new page with static collection of information

get "/fav_things/index" do
	@fav_things = FavThing.all
	erb :"fav_things/index"
end


#shows error page

get "/fav_things/error" do
	erb :"fav_things/error"
end

#shows page to set up creating a single member from a collection 

get "/fav_things/new" do
	@f = FavThing.new
	@new_f = FavThing.new
	erb :"fav_things/new"
end

#shows static single member to confirm delete

get "/fav_things/:id" do
	@fav_thing = FavThing.find(params[:id])
	erb :"fav_things/show"
end

# shows page to edit single member

get "/fav_things/:id/edit" do
	@fav_thing = FavThing.find(params[:id])
	erb :"fav_things/edit"
end




#defines what delete action does

delete "/fav_things/:id" do 
	@fav_thing = FavThing.find(params[:id])
	if @fav_thing.delete
		redirect "/fav_things/index"
	else
		redirect "/fav_things/error"
	end
end

#defines what put action (update action) does

put "/fav_things/:id" do
	@fav_thing = FavThing.find(params[:id])
	if @fav_thing.update_attributes(params[:fav_thing])
		redirect "/fav_things/index"
	else
		redirect "/fav_things/error"
	end
end

#defines what post action (adding new member to collection) does ]

post "/fav_things" do
	# @fav_thing.save
	# redirect "/fav_things/index"
	@fav_thing = FavThing.new(params[:fav_thing])
	if @fav_thing.author_name == "I never read"
		redirect "/fav_things/error"
	else
		@fav_thing.save
		redirect "/fav_things/index"
	end
end



class FavThing < ActiveRecord::Base

	
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