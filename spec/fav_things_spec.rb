require 'rspec'
require './app.rb'

describe ToDo do
	it 'should have to-dos' do
		ToDo.to_dos.should_not be_empty
	end

	it 'should add a to-do' do
		first_count = ToDo.to_dos.count
		to_do = "Brush teeth"
		ToDo.add_to_do(to_do)
		second_count = ToDo.to_dos.count

		second_count.should > first_count
	end

end

#how to stub?
# RACK_ENV=production rackup config.ru # puts it into production environment for Sinatra