CommandCenter::Application.routes.draw do
  match '/auth/facebook/callback', to: "sessions#create"
  root :to => 'pages#home'
  resources :instructions
  resource :session
end
