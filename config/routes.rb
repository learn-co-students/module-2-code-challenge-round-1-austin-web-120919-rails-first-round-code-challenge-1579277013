Rails.application.routes.draw do

  resources :powers, only: [:index, :show]
  resources :heroines do
    match :create, via: [:get,:post]
  end 
end
