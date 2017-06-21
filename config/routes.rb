Rails.application.routes.draw do

  root "static_pages#about" #this needs to be changed

  get '/about', to: "static_pages#about"

  devise_for :users, path: 'u'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  resources :users, :path => 'u'

end