Rails.application.routes.draw do
  resources :attendances
  resources :events
  devise_for :users

  resources :attendances do
    match '/new', to: 'attendances#create', via: :post, on: :collection
  end
  root 'events#index'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
