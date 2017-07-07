Rails.application.routes.draw do

	authenticated do
	  root to: 'static_pages#agora'
	end

	devise_scope :user do
	  root to: "devise/sessions#new"
	end
  
  get '/fail', to: 'static_pages#fail'

  get '/admin', to: 'static_pages#admin'

  get '/agora', to: 'static_pages#agora'
  
  devise_for :users, path: 'u', :controllers => { registrations: 'registrations' }

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  resources :users, only: [:show], :path => 'u'
  resources :posts,          only: [:create]

end