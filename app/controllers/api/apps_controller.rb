class Api::AppsController < InheritedResources::Base
  skip_before_filter :verify_authenticity_token
  custom_actions collection: :search, member: :download
  respond_to :json
  has_scope :with_max_price, as: :max_price, only: :search
  has_scope :with_min_price, as: :min_price, only: :search
  has_scope :with_sorting, as: :sorting, using: [:sort, :dir], default: ['title', 'asc'], type: :hash, only: :search

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

  def search
    collection = apply_scopes(App).page(params[:page]).per(params[:per_page])
    if (@q = params[:q])
      term = "%#{@q.downcase}%"
      collection = collection.where("(lower(title) LIKE ?) OR (lower(short_description) LIKE ?) OR (lower(long_description) LIKE ?) OR (lower(author) LIKE ?)", term, term, term, term)
    end
    # respond_with not working out of the box
    respond_to do |format|
      format.json{ render :json => collection.to_json }
    end
  end

  private
  def permitted_params
    params.require(:app).permit(:title, :short_description, :author, :price)
  end
end
