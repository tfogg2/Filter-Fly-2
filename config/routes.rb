Rails.application.routes.draw do

  mount ShopifyApp::Engine, at: '/'
  resources :products

  resources :collections do
    resources :categories do
    	resources :product_types do
    		resources :tags
    	end
    end
  end 

  
  root :to => 'collections#index'
  get 'index', to: "collections#index"
  get 'select_change', to: "products#select_change"
  get 'navbar_select', to: "shared#navbar_select"

  namespace :api do
    get 'collections', to: "collections#index"
    get 'main', to: "javascripts#main"
  end
  #get 'tutorial', to: "shared#_tutorial"
  #get 'navbar', to: 'collections#navbar'
 #get 'products/select_change', to: "", constraints: { format: 'json' }
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
