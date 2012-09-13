DeviseProject::Application.routes.draw do
  devise_for :users

  resources :diary_entries, :only => [:create, :index, :new, :show]

  root :to => 'static_pages#home'
end
