class AddRatings < ActiveRecord::Migration
  def change
    add_column :apps, :rating, :float
  end
end
