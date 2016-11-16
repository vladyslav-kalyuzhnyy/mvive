Rails.application.routes.draw do

  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  root 'static_pages#home'

  get 'robots' => 'public#robots', format: :text
  get '/auth/:provider/callback', to: 'sessions#create'
  get "help", to: "static_pages#help"
  get "about", to: "static_pages#about"
  get "advert", to: "static_pages#advert"
  get "partners", to: "static_pages#partners"
  devise_for :users, controllers: { sessions: "users/sessions", registrations: "users/registrations", confirmations: "users/confirmations", passwords: "users/passwords", :omniauth_callbacks => "users/omniauth_callbacks"}
  devise_scope :user do
    get "login", to: "users/sessions#new"
    get "signup", to: "users/registrations#new"
  end
  post "photos", to: "photos#create"
  resources :profiles
  resources :news
  resources :shoppingandmakeup
  resources :fashionshow

  get "my_profile", to: "profiles#my_profile"
  get "search", to: "profiles#search"
  get "feed", to: "profiles#index"

  resources :relationships, only: [:create, :destroy]
  resources :conversations, only: [:index, :show]
  resources :castings, only: [:index, :show, :new, :create]
  delete "castings/:id", to: "castings#destroy", as: :destroy_casting
  get "premium", to: "castings#premium"
  resources :users do
    resources :feedbacks
  end
  post "messages/:id", to: "messages#create", as: :messages
  post "add/:id", to: "conversations#add_conversation", as: :add
  post "comments/:id", to: "comments#create", as: :comments
  post "castings/select/:id", to: "castings#select_user", as: :select
  post "castings/unselect/:id", to: "castings#unselect_user", as: :unselect
end
