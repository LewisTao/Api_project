require 'api_constraints'

ApiProject::Application.routes.draw do
  namespace :api, defaults: {format: :json}, constraints: {subdomain: 'api'}, path: '/'  do
    scope module: :v1, constraints: ApiConstraints.new(version:1, default: false) do
    	resources :users, except: [:edit] do
    		resources :products, only: [:create, :update, :destroy]
        resources :orders, only: [:index, :show, :create]
    	end
    	resources :sessions, only: [:create, :destroy]
    	resources :products, only: [:show, :index]
    end
  end
  devise_for :users
end