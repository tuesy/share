Rails.application.routes.draw do
  root 'home#index'
  resources :games

  mount RailsAdmin::Engine => '/admin', :as => 'rails_admin'
end
