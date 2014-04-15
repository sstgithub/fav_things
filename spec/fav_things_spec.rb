require 'rspec'
require './app.rb'

describe FavThing do
	it 'should have fav-things' do
		FavThing.fav_things.should_not be_empty
	end

	it 'should add an author' do
		first_count = FavThing.fav_things.count
		fav_thing = "boogabooga"
		FavThing.add_fav_thing(fav_thing)
		second_count = FavThing.fav_things.count

		second_count.should > first_count
	end

end

#how to stub?
# RACK_ENV=production rackup config.ru # puts it into production environment for Sinatra