class Api::AppsController < InheritedResources::Base
  skip_before_filter :verify_authenticity_token
  custom_actions collection: :search, member: :download
  respond_to :json

  def create
    resource = App.new(permitted_params)
    resource.save
    respond_with resource
  end

  def update
    resource.update_attributes(permitted_params)
    update!
  end

  # TODO: make this more robust so we can optimize for performance,
  # track analytics, and not block workers
  def download
    file = File.read(File.join(Rails.root, 'public/robots.zip'))
    send_data file, :type => 'application/zip; header=present', :disposition => "attachment; filename=robots.zip"
  end

  private
  def permitted_params
    params.require(:app).permit(:title, :short_description, :author, :price)
  end
end
