Rails.application.routes.draw do
  devise_for :users, controllers: { registrations: "registrations" }
  root to: 'pages#home'
  get "quiz", to: "pages#quiz", as: :quiz
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :user_interests, only: [:new, :create]
  resources :users, only: [:edit, :update]
end
