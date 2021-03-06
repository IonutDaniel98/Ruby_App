Rails.application.routes.draw do

  namespace 'api' do
    namespace 'v1' do
      resources :microposts
    end
  end

  get 'sessions/new'

  get 'users/new'

  root 'static_pages#home'

  get  '/help',    to: 'static_pages#help'
  get  '/about',   to: 'static_pages#about'
  get  '/contact', to: 'static_pages#contact'
  get  '/home',    to: 'static_pages#home'
  get  '/signup',  to: 'users#new'
  post '/signup',  to: 'users#create'
  get    '/login',   to: 'sessions#new'
  post   '/login',   to: 'sessions#create'
  delete '/logout',  to: 'sessions#destroy'
  get '/users',      to: 'users#index'

  resources :users
  resources :account_activations, only: [:edit]
  #Module :api do
  #  Module :v1 do
  #    Resources :microposts
  #  end
  #end
  resources :microposts#,          only: [:create, :destroy, :edit]
  #post '/microposts/:id/edit', to: 'microposts#edit'
end
