Rails.application.routes.draw do
  root 'home#index'
  resources :genres, :categories, :users, :comments
  resources :apps do
    member do
      get :download
    end
    collection do
      post :search
    end
  end

  # TODO: choose whether to nest exclusively or now.
  # for now, making it work with activeresource
  namespace :api do
    resources :comments
    resources :apps do
      resources :comments, only: :index
      collection do
        post :search
      end
      member do
        get :download
      end
    end
  end

  mount RailsAdmin::Engine => '/admin', :as => 'rails_admin'
end
