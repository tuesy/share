class HomeController < ApplicationController
  def index
    @categories = %w(All Newest Top\ Rated) + Category.all
    @genres = Genre.all
  end
end
