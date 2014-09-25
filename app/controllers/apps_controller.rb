class AppsController < ApplicationController
  def index
    @categories = [['All', 'title'], ['Newest', 'created_at'], ['Top Rated', 'rating']] + Category.all
    @genres = Genre.all
    @page = params[:page]
    if params[:category]
      @filter = "Browse Category: #{params[:category]}"
      @apps = Category.find_by_title(params[:category]).apps
    elsif params[:genre]
      @filter = "Browse Genre: #{params[:genre]}"
      @apps = Genre.find_by_title(params[:genre]).apps
    else
      @filter = "Browse All"
      @apps = App.all
    end
    @order = params[:order] || 'created_at'
    @direction = params[:direction] || 'DESC'
    @apps = @apps.order("#{@order} #{@direction}")
    @platform = params[:platform]
    @apps = @apps.where("lower(platforms) LIKE ?", "%#{@platform.downcase}%") if @platform
    @apps = @apps.page(@page).per(8)
  end

  def show
    @app = App.find(params[:id])
    @user = @app.user
  end

  def download
    render :nothing => true
  end
end
