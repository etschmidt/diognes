Rails.application.routes.draw do

	authenticated do
	  root to: 'static_pages#agora'
	end

	devise_scope :user do
	  root to: "devise/sessions#new"
	end
  
  post 'search' => 'users#search'

  get '/fail', to: 'static_pages#fail'

  get '/admin', to: 'static_pages#admin'

  get '/agora', to: 'static_pages#agora'
  
  devise_for :users, path: 'u', :controllers => { registrations: 'registrations', omniauth_callbacks: 'omniauth_callbacks' }

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  resources :users, only: [:index, :show], :path => 'u' do
    post 'search', :on => :collection
  end
  
  resources :posts,          only: [:create, :destroy, :show]

end