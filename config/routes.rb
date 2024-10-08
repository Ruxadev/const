Rails.application.routes.draw do
  root 'projects#index'
  devise_for :users
  delete '/users/sign_out', to: 'application#destroy', as: :sign_out
  resources :projects do
    resources :workers
    resources :materials
  end
end