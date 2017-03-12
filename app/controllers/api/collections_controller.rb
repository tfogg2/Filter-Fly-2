class Api::CollectionsController < Api::BaseController	
	def index
		@shop = Shop.last
		collections_json = @shop.collections.as_json
		render json: collections_json
	end
end
