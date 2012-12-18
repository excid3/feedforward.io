FeedForward::Application.routes.draw do
  devise_for :users

  resources :links do
    collection { get :title }
    member { get :go }
    resources :comments
  end

  resources :podcasts do
    member { get :go }
  end


  root to: "links#index"
end
