Rails.application.routes.draw do
  devise_for :users
  root to: "groups#index"
  
  resources :users, only: [:edit,:update,:index]
  resources :groups, only: [:new,:create,:edit,:update,:index] do
    resources :messages
  end
  resources :entries, defaults: { format: 'json' }
  



  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
