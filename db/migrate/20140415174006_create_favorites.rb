class CreateFavorites < ActiveRecord::Migration
  def change
  	create_table :fav_things do |f|
  		f.string :author_name
  		f.timestamps
  	end
  end
end
