Rails.application.routes.draw do
  resources :slots
  resources :companies
  resources :trippackages
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  devise_for :users
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
   get 'home/index'
   get 'home/about'
   get 'mainportal/admindashboard'
   get 'mainportal/adminpackage'
   get 'home/myslots'
  # Defines the root path route ("/")
  # root "home#index"
  devise_scope :user do
  get '/users/sign_out' => 'devise/sessions#destroy'
 #  match '*unmatched', to: 'application#render_404', via: :all,constraints: lambda { |req| req.path.exclude? 'rails/active_storage' }
end
 # Defines the root path route ("/")

  devise_scope :user do
  root 'devise/sessions#new'
end

end
