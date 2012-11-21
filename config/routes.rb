FeedForward::Application.routes.draw do
  devise_for :users
  resources :links
  root to: "links#index"
end
