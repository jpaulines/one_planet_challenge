Rails.application.routes.draw do

  resources :users, only: [:edit, :update]
  devise_for :users, controllers: { registrations: "registrations" }

  root to: 'pages#home'
  # authenticate :user do
  #   root to: 'dashboards#dashboard'
  # end
  get 'dashboard', to: "dashboards#dashboard", as: 'dashboard'
  get 'my_challenges', to: "dashboards#my_challenges", as: 'my_challenges'
  get 'journey', to: "dashboards#journey", as: 'journey'
  get "quiz", to: "pages#quiz", as: :quiz
  get "about", to: "pages#about", as: :about
  get "result", to: "pages#result", as: :result
  post "compute_result", to: "pages#compute_result"

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  resources :user_interests, only: [:new, :create]

  resources :challenges do
    resources :user_challenges, only: [:create]
  end
  resources :user_challenges, only: [:update] do
    member do
      patch "reactivate_challenge"
    end
  end

  # get "posts", to: "posts#index", as: :index

  resources :users do
    resources :posts, only: [:create]
  end

  resources :posts do
    resources :answers, only: [:create]
  end

end
