class CollectionsController < ShopifyApp::AuthenticatedController
	def index
		@products = ShopifyAPI::Product.find(:all) #, params: { limit: 10 }
		@custom_collections = ShopifyAPI::CustomCollection.find(:all) #, params: { limit: 10 }
		@smart_collections = ShopifyAPI::SmartCollection.find(:all) #, params: { limit: 10 }

		# Create custom collections
		@custom_collections.each do |c|
			@shop.find_or_create_collection(c)  #title: c.title, collection_id: c.id)
		end

		# Create smart collections
		@smart_collections.each do |c|
			@shop.find_or_create_collection(c)
		end
	end
	
end
