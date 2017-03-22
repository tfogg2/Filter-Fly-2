class SharedController <ApplicationController

	def navbar_select 
		@category = Category.find_by_id(params[:category_id])
	end



end