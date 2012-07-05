CommandCenter::Application.routes.draw do
  match '/auth/facebook/callback', to: "sessions#create"
  match '/tos', to: 'pages#tos', as: :tos
  match '/privacy', to: 'pages#privacy', as: :privacy
  match '/instructions/runnable', to: 'instructions#runnable'
  match '/generate_reports', to: 'users#generate_reports'
  root :to => 'pages#home'
  resources :instructions
  resources :reports
  resource :session
  resources :alerts, only: :create
  resources :users, only: :destroy
end
