Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  get "quiz", to: "pages#quiz", as: :quiz
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
