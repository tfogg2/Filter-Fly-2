class Api::CollectionsController < Api::BaseController	
	def index
		render json: ["array", "of", "strings"]
	end
end
