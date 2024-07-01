Rails.application.routes.draw do
  devise_for :users
  root to: "pages#home"
  get "about-us", to: "pages#about_us", as: 'about_us'

  resources :rooms, only: [:index, :show] do
    resources :bookings, only: [:create]
  end
end
