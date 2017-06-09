Rails.application.routes.draw do
  devise_for :users, :controllers => { :registrations => "registrations" }

  devise_scope :user do
    get '/adminpage' => 'users#index'
    get '/adminpage/:id' => 'users#edit'
    put '/adminpage.:id' => 'users#change_admin'
  end

  root to: 'pages#home'
  get 'about' => 'pages#about'
  get 'contact' => 'pages#contact'
  resources :matchdays
end
