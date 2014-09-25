class HomeController < ApplicationController
  def index
    @categories = [['All', 'title'], ['Newest', 'created_at'], ['Top Rated', 'rating']] + Category.all
    @genres = Genre.all
    @featured = [
      App.find_by_title('Vanguard V'),
      App.find_by_title('SightLine: The Chair'),
      App.find_by_title('Blocked In'),
      App.find_by_title('VR Cinema'),
      App.find_by_title('Half Life 2'),
      App.find_by_title('Ocean Rift')
    ]
    @heroes = [App.find_by_title('Faceted Flight')]
    @top_rated = App.all.order('rating DESC').limit(5)
    @newest = App.all.order('created_at DESC').limit(5)
  end
end
