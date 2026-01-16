Rails.application.routes.draw do
   #GET /about
   
   get "about", to: "about#index", as: :about

   get "password", to: "passwords#edit", as: :edit_password
   patch "password", to: "passwords#update"

   get "sign_up", to: "registration#new"
   post "sign_up", to: "registration#create"

   get "sign_in", to: "sessions#new"
   post "sign_in", to: "sessions#create"
   
   delete "logout", to: "sessions#destroy"

   get "password_reset", to: "password_resets#new"
   post "password_reset", to: "password_resets#create"

   
   # you can replace get with root when defining the main page
   root to: "main#index"
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  # Render dynamic PWA files from app/views/pwa/* (remember to link manifest in application.html.erb)
  # get "manifest" => "rails/pwa#manifest", as: :pwa_manifest
  # get "service-worker" => "rails/pwa#service_worker", as: :pwa_service_worker

  # Defines the root path route ("/")
  # root "posts#index"
end
