Rails.application.routes.draw do
  root 'home#index'
  resources :genres, :categories, :users
  resources :apps do
    member do
      get :download
    end
  end

  mount RailsAdmin::Engine => '/admin', :as => 'rails_admin'
end
