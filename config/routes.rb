Rails.application.routes.draw do
  root :to => 'collections#index'
  mount ShopifyApp::Engine, at: '/'
  resources :products
  
  
  resources :categories do
  	resources :product_types do
  		resources :tags
  	end
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
