Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root to:'kimonos#index'
  resources :kimonos do
    collection do
      get 'search'
    end
  end
  resources :obis
  resources :items
end
