Rails.application.routes.draw do
  devise_for :users

  devise_scope :user do
    get '/adminpage' => 'users#index'
  end

  root to: 'pages#home'
  resources :matchdays
end
