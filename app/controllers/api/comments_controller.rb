class Api::CommentsController < InheritedResources::Base
  skip_before_filter :verify_authenticity_token
  respond_to :json

  def index
    @app = App.find(params[:app_id])
    respond_with @app.comments.page(params[:page]).per(params[:per_page])
  end

  def create
    resource = Comment.new(permitted_params)
    resource.save
    respond_with resource
  end

  def update
    resource.update_attributes(permitted_params)
    update!
  end

  private
  def permitted_params
    params.require(:comment).permit(:text, :app_id)
  end
end
