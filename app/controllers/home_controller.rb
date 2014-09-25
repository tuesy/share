class HomeController < ApplicationController
  def index
    @categories = [['All', 'title'], ['Newest', 'created_at'], ['Top Rated', 'rating']] + Category.all
    @genres = Genre.all
    @featured = App.all[10..15]
    @heroes = [App.find_by_title('Faceted Flight')]
    @top_rated = App.all.order('rating DESC').limit(5)
    @newest = App.all.order('created_at DESC').limit(5)
  end
end
