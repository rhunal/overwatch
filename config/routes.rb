Rails.application.routes.draw do
  resources :abilities
  resources :heros
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root to: 'heros#index'

  namespace :api do
    resources :heros, only: [:index, :show]  do
      get 'abilities', on: :member
    end

    resources :abilities, only: [:index, :show]
  end
end
