require 'api_constraints'

ApiProject::Application.routes.draw do
  namespace :api, defaults: {format: :json}, constraints: {subdomain: 'api'}, path: '/'  do
    scope module: :v1, constraints: ApiConstraints.new(version:1, default: false) do
    	resources :users, except: [:edit]
    	resources :sessions, only: [:create, :destroy]
    end
  end
  devise_for :users
end