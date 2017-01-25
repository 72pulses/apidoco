Apidoco::Engine.routes.draw do
  root 'apis#index'
  resources :apis, only: [:index]
end
