CommandCenter::Application.routes.draw do
  match '/auth/facebook/callback', to: "sessions#create"
  match '/tos', to: 'pages#tos' as: :tos
  match '/privacy', to: 'pages#privacy', as: :privacy
  root :to => 'pages#home'
  resources :instructions
  resources :reports
  resource :session

end
