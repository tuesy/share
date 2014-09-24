Rails.application.routes.draw do
  root 'home#index'
  resources :genres, :categories, :apps

  mount RailsAdmin::Engine => '/admin', :as => 'rails_admin'
end
