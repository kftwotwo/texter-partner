Rails.application.routes.draw do
  root to: "home#index"
  resources :messages, :only => [:index, :new, :create, :show]
  resources :contacts
end
