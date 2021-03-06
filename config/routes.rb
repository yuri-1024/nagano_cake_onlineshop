Rails.application.routes.draw do

  root "public/sweets#top"

  devise_for :admins, controllers:{
  	sessions: 'admins/sessions',
  	passwords: 'admins/passwords',
  	registrations: 'admins/registrations'
  }

  devise_for :customers, controllers:{
  	sessions: 'customers/sessions',
  	passwords: 'customers/passwords',
  	registrations: 'customers/registrations'
  }

  namespace :admin do
    resources :sweets, only:[:index, :new, :create, :show, :edit, :update]
    resources :genres, only:[:index, :create, :edit, :update]
    resources :customers, only:[:index, :show, :edit, :update]
    resources :orders, only:[:index, :show, :update]
    resources :order_lists, only:[:update]
    resources :top, only:[:index]
  end

  scope module: :public do
    resources :sweets, only:[:index, :show]
    get 'genre' => 'sweets#genre'
    get 'about' => 'sweets#about'

    resource :customers, only:[:show]
    get 'profile_edit' => 'customers#edit'
    patch 'profile_update' => 'customers#update'
    get 'unsubscribe' => 'customers#unsubscribe'
    patch 'withdraw' => 'customers#withdraw'
    resources :deliveries, only:[:index, :edit, :create, :update, :destroy]
    resources :carts, only:[:index, :update, :destroy, :create]
    delete 'destroy_all' => 'carts#destroy_all'
    resources :orders, only:[:new, :create, :index, :show]
    post 'comfirm' => 'orders#comfirm'
    get 'complete' => 'orders#complete'
  end


  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
