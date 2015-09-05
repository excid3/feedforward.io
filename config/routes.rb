Rails.application.routes.draw do
  devise_for :users, controllers: { registrations: "users/registrations" }

  resources :links, path: "recommended" do
    resource :vote

    member do
      get :go
    end
  end

  root to: "links#index"
end
