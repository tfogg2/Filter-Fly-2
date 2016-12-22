Rails.application.routes.draw do
  root :to => 'collections#index'
  mount ShopifyApp::Engine, at: '/'
  resources :products
  
  
  resources :categories do
  	resources :product_types do
  		resources :tags
  	end
  end

  get 'select_change', to: "products#select_change"
  get 'navbar_select', to: "shared#navbar_select"
  #get 'navbar', to: 'collections#navbar'
 #get 'products/select_change', to: "", constraints: { format: 'json' }
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
