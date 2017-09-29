class CollectionsController < ShopifyApp::AuthenticatedController
	# before_action :set_shop
	def index
		@products = ShopifyAPI::Product.find(:all) #, params: { limit: 10 }
		@custom_collections = ShopifyAPI::CustomCollection.find(:all) #, params: { limit: 10 }
		@smart_collections = ShopifyAPI::SmartCollection.find(:all) #, params: { limit: 10 }

		@collections = @custom_collections && @smart_collections

		@category = @custom_collections.categories.new(category_params) || @smart_collections.categories.new(category_params) 

		# @collections_search = @collections.search(params[:search])
		# Create custom collections
		@custom_collections.each do |c|
			@shop.find_or_create_collection(c)
		end

		# Create smart collections
		@smart_collections.each do |c|
			@shop.find_or_create_collection(c)
		end
	end

	def search
		@custom_collections = ShopifyAPI::CustomCollection.search(params[:search]) #, params: { limit: 10 }
		@smart_collections = ShopifyAPI::SmartCollection.search(params[:search])
	end

end
