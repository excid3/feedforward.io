FeedForward::Application.routes.draw do
  devise_for :users
  resources :links do
    collection { get :title }
  end
  root to: "links#index"
end
