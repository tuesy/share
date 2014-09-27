class App < ActiveRecord::Base
  belongs_to :user
  belongs_to :category
  has_and_belongs_to_many :genres
  has_many :comments

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
    self.platforms.split(',').map(&:strip) rescue []
  end

  # overriding this for now
  def short_description
    x = self.read_attribute(:short_description)
    if x.blank? && !self.long_description.blank?
      self.long_description.gsub(/<.*>/, '')
    else
      x
    end
  end
end
