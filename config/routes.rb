DeviseProject::Application.routes.draw do
  devise_for :users

  resources :diary_entries, :only => [:index]

  root :to => 'static_pages#home'
end
