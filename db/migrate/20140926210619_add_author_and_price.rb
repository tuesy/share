class AddAuthorAndPrice < ActiveRecord::Migration
  def change
    add_column :apps, :author, :string
    add_column :apps, :price, :float
  end
end
