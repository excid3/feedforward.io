FeedForward::Application.routes.draw do
  devise_for :users
  resources :links do
    collection do
      get :title
    end
  end
  root to: "links#index"
end
