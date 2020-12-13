Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  namespace :api do
    namespace :v1 do
      resources :users, :only => [:show, :update] do
        collection do
          get :following
          get :followers
        end
      end

      resources :tweets, only: [:create, :update, :index, :destroy] do
        post :like, :to => "likes#like"
        post :unlike, :to => "likes#unlike"
      end

      resources :relationships, only: [:create, :destroy]
      resources :feeds, only: [:index]

      post "auth/login", :to => "sessions#create"
      post "signup", :to => "registration#create"
    end
  end
end
