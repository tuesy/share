class GeneratePrices < ActiveRecord::Migration
  def up
    App.all.each do |x|
      unless x.price
        x.price = rand(50).to_f + 0.99
        x.save!
      end
    end
  end
  def down
    # nothing
  end
end
