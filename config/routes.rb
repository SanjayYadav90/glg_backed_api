Rails.application.routes.draw do

  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)

  root to: 'home#index'

  namespace :api do 
    namespace :v1 do 
     resources :users, only: [:index, :create, :destroy, :update]
    end 
  end 

end
