class AppsController < ApplicationController
  def index

  end

  def show
    @app = App.find(params[:id])
    @user = @app.user
  end

  def download
    render :nothing => true
  end
end
