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
    root 'home#top'
    get 'results' => 'searchs#index'
  	resources :users, only: [:index, :show, :edit, :update]
  	resources :photos, except: [:new, :create, :destroy] do
      resources :photo_comments, only: [:destroy]
    end
  end
  scope module: :users do
    root 'home#top'
    get 'results' => 'searchs#index'
    get 'about' => 'home#about'
    get 'glossary' => 'home#glossary'
    get 'ranking' => 'home#ranking'
    get 'users/confirm' => 'users#confirm'
    patch 'users/delete' => 'users#delete'
    post 'follow/:id' => 'relationships#follow', as: 'follow'
    post 'unfollow/:id' => 'relationships#unfollow', as: 'unfollow'
    get 'user/:id/follows' => 'relationships#follows', as: 'follows'
    get 'user/:id/followers' => 'relationships#followers', as: 'followers'
  	resources :users, only: [:show, :edit, :update]
  	resources :cameras, except: [:new, :show]
  	resources :photos, except: [:index] do
      resources :photo_comments, only: [:create, :destroy]
      resource :favorites, only: [:create, :destroy]
    end
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
