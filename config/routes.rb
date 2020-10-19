Rails.application.routes.draw do
  devise_for :admins, controllers:{
  	sessions: 'admins/sessions',
  	wasswords: 'admins/passwords',
  	registrations: 'admins/registrations'
  }

  devise_for :customers, controllers:{
  	sessions: 'customers/sessions',
  	passwords: 'customers/passwords',
  	registrations: 'customers/registrations'
  }

  root "public/sweets#top"

  namespace :admin do
    resources :sweets, only:[:index, :new, :create, :show, :edit, :update]
  end

  namespace :public do
    resources :sweets, only:[:index, :show]
    get 'public/sweets/top' => 'public/sweets#top'
    get 'public/sweets/genre' => 'public/sweets#genre'
  end


  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
