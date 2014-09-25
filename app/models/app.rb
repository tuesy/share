class App < ActiveRecord::Base
  belongs_to :user
  belongs_to :category
  has_and_belongs_to_many :genres

  def platforms_array
    self.platforms.split(',').map(&:strip)
  end
end
