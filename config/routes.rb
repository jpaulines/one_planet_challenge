Rails.application.routes.draw do
  devise_for :users, controllers: { registrations: "registrations" }
  root to: 'pages#home'
  get "quiz", to: "pages#quiz", as: :quiz
  get "result", to: "pages#result", as: :result
  post "compute_result", to: "pages#compute_result"
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :users, only: [:edit] do
    resources :user_interest, only: [:new]
  end
end
