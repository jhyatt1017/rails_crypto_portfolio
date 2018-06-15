Rails.application.routes.draw do
  devise_for :users
  # homepage path
  root 'home#index' 
  # about page path
  get 'home/about'
  # lookup "search page" path
  get 'home/lookup' 
  post "/home/lookup" => 'home/lookup'
  
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
