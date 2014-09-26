class AddDefaultRating < ActiveRecord::Migration
  def up
    change_column :apps, :rating, :float, default: 0.0
    App.all.each do |x|
      x.rating = 0.0 unless x.rating
      x.save!
    end
  end

  def down

  end
end
