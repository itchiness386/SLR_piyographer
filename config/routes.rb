Rails.application.routes.draw do
  devise_for :admins, controllers: {
    sessions:      'admins/sessions',
    passwords:     'admins/passwords',
    registrations: 'admins/registrations'
  }
  devise_for :users, controllers: {
    sessions:      'users/sessions',
    passwords:     'users/passwords',
    registrations: 'users/registrations'
  }
  namespace :admins do
  	resources :users, only: [:index, :show, :edit, :update]
  end
  scope module: :users do
    get 'users/confirm' => 'users#confirm'
    patch 'users/delete' => 'users#delete'
  	resources :users, only: [:show, :edit, :update]
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
