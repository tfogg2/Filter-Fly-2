class CollectionsController < ShopifyApp::AuthenticatedController
	# before_action :set_shop
	before_action :set_collection, only: [:show, :edit, :update, :destroy]
	def index
		@products = ShopifyAPI::Product.find(:all) #, params: { limit: 10 }
		@custom_collections = ShopifyAPI::CustomCollection.find(:all) #, params: { limit: 10 }
		@smart_collections = ShopifyAPI::SmartCollection.find(:all) #, params: { limit: 10 }

		# @category = @custom_collections.categories.new(category_params) || @smart_collections.categories.new(category_params)

		# @collections_search = @collections.search(params[:search])
		# Create custom collections
		@custom_collections.each do |c|
			@shop.find_or_create_collection(c)
		end

		# Create smart collections
		@smart_collections.each do |c|
			@shop.find_or_create_collection(c)
		end

		@collections = Collection.all
	end

	def search
		@collections = Collection.search(params[:search])
	end

	def show
		@collection = Collection.find(params[:id])
	end

	def set_collection
		@collection = Collection.find(params[:id])
	end

end
