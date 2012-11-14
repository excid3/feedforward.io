Feedist::Application.routes.draw do
  resources :links
  root to: "links#index"
end
