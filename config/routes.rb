Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  namespace :api do
    namespace :v1 do
        namespace :merchants do
          get '/find', to: 'search#show'
        end
        namespace :items do
          get '/find_all', to: 'search#index'
        end
        resources :merchants, only: [:index, :show]
        resources :items
        get '/merchants/:merchant_id/items', to: 'merchant_items#index'
        get 'items/:id/merchant', to: 'items_merchant#show'
    end
  end
end
