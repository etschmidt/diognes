Rails.application.routes.draw do

  root 'users#current_user_home' #this needs to be changed

  get '/about', to: 'static_pages#about'
  
  get '/fail', to: 'static_pages#fail'
  
  devise_for :users, path: 'u'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  resources :users, :path => 'u'
  resources :posts,          only: [:create]

end