Rails.application.routes.draw do
  root "home#index"

  resources :home, only: [:index]

  devise_for :users
  devise_scope :user do
    get '/users/sign_out' => 'devise/sessions#destroy'
  end

  resources :boards do
    resources :lists do
      resources :cards
    end
  end
end
