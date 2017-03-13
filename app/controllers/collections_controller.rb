class CollectionsController < ShopifyApp::AuthenticatedController
	before_action :clear_shopify_collection_id, :only => :index
	
	def index
		Rails.logger.debug("set_shopify_collection_id: #{session[:shopify_collection_id]}")

		@products = ShopifyAPI::Product.find(:all) #, params: { limit: 10 }
		@customCollections = ShopifyAPI::CustomCollection.find(:all) #, params: { limit: 10 }
		@smartCollections = ShopifyAPI::SmartCollection.find(:all) #, params: { limit: 10 }

		# Create custom collections
		@customCollections.each do |c|
			@shop.find_or_create_collection(c)
		end

		# Create smart collections
		@smartCollections.each do |c|
			@shop.find_or_create_collection(c)
		end
	end
end
