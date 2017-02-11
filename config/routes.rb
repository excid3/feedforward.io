Rails.application.routes.draw do
  authenticate :user, lambda { |u| u.admin? } do
    namespace :admin do
      resources :users
      resources :links
      resources :votes

      root to: "users#index"
    end
  end

  devise_for :users, controllers: { registrations: "users/registrations" }

  resources :links, path: "recommended" do
    resource :vote

    member do
      get :go
    end
  end

  root to: "links#index"
end
