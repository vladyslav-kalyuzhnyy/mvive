Rails.application.routes.draw do
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  root 'static_pages#home'
  get 'sitemap' => 'home#sitemap'
  get 'robots' => 'home#robots', format: :text
  get '/auth/:provider/callback', to: 'sessions#create'
  get "help", to: "static_pages#help"
  get "about", to: "static_pages#about"
  get "advert", to: "static_pages#advert"
  get "partners", to: "static_pages#partners"
  get "contactus", to: "static_pages#contactus"
  devise_for :users, controllers: { sessions: "users/sessions", registrations: "users/registrations", confirmations: "users/confirmations", passwords: "users/passwords", :omniauth_callbacks => "users/omniauth_callbacks"}
  devise_scope :user do
    get "login", to: "users/sessions#new"
    get "signup", to: "users/registrations#new"
  end
  post "photos", to: "photos#create"
  resources :profiles
  resources :news
  get "news_trends", to: "news#news_trends"
  get "news_fashionshows", to: "news#news_fashionshows"
  get "news_arts_and_lifestyle", to: "news#news_arts_and_lifestyle"
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
  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  # root 'welcome#index'

  # Example of regular route:
  #   get 'products/:id' => 'catalog#view'

  # Example of named route that can be invoked with purchase_url(id: product.id)
  #   get 'products/:id/purchase' => 'catalog#purchase', as: :purchase

  # Example resource route (maps HTTP verbs to controller actions automatically):
  #   resources :products

  # Example resource route with options:
  #   resources :products do
  #     member do
  #       get 'short'
  #       post 'toggle'
  #     end
  #
  #     collection do
  #       get 'sold'
  #     end
  #   end

  # Example resource route with sub-resources:
  #   resources :products do
  #     resources :comments, :sales
  #     resource :seller
  #   end

  # Example resource route with more complex sub-resources:
  #   resources :products do
  #     resources :comments
  #     resources :sales do
  #       get 'recent', on: :collection
  #     end
  #   end

  # Example resource route with concerns:
  #   concern :toggleable do
  #     post 'toggle'
  #   end
  #   resources :posts, concerns: :toggleable
  #   resources :photos, concerns: :toggleable

  # Example resource route within a namespace:
  #   namespace :admin do
  #     # Directs /admin/products/* to Admin::ProductsController
  #     # (app/controllers/admin/products_controller.rb)
  #     resources :products
  #   end
end
