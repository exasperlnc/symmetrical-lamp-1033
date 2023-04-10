Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get '/customers/:id', to: 'customer#show'
  get '/customer_items/new', to: 'customer_item#new'
  post '/customer_items', to: 'customer_item#create'
  get '/items', to: 'item#index'
end
