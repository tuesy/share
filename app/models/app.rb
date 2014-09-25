class App < ActiveRecord::Base
  belongs_to :user
  belongs_to :category
  has_and_belongs_to_many :genres

  class << self
     def random(number)
      chosen = []
      total = self.count
      everything = self.all
      6.times do |x|
        chosen << everything[rand(total - 1)]
      end
      chosen
    end
  end

  def platforms_array
    self.platforms.split(',').map(&:strip)
  end

  # overriding this for now
  def short_description
    self.long_description.gsub(/<.*>/, '')
  end
end
