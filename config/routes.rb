Rails.application.routes.draw do
  #resources :offers, only: [:show, :new, :create]

  devise_for :users
  root to: 'pages#home'
  get "contact", to: "pages#contact"
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  get "bookings/:id/decline", to: "bookings#decline", as: "decline_booking"
  resources :offers do
    resources :bookings, only: [:new, :create]
  end

  resources :bookings, only: [:index, :destroy, :edit, :update]
    patch '/accept/:id', to: 'bookings#accept', as: :accept
    patch '/reject/:id', to: 'bookings#reject', as: :reject

end
