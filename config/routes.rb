Rails.application.routes.draw do

  root 'home#index'
  resources :home, only: [:index]

  get "how" => "how#show", as: :how
  get "projects" => "projects#show", as: :projects
  get "source" => "source#show", as: :source

  resources :admin, only: [:show, :index]

  resources :coders

  resource :pull_request_download, only: :create

end
