class CollectionsController < ShopifyApp::AuthenticatedController
	# before_action :set_shop
	def index
		@products = ShopifyAPI::Product.find(:all) #, params: { limit: 10 }
		@custom_collections = ShopifyAPI::CustomCollection.find(:all) #, params: { limit: 10 }
		@smart_collections = ShopifyAPI::SmartCollection.find(:all) #, params: { limit: 10 }

		@collections = (@custom_collections && @smart_collections).search(params[:search])

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


end
