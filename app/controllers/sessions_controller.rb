class SessionsController <ApplicationController

	def show
		ShopifyAPI::Base.activate_session(session)
	    response = request.env['omniauth.auth']
	    if response.present?
	      auth_token = response['credentials']['token']
	      session[:shopify] = ShopifyAPI::Session.new(params[:shop], auth_token)

	      # This is where the error happens:
	      Rails.logger.debug ShopifyAPI::Shop.current

	      redirect_to root_path, notice: 'Successfully logged in.'
	    else
	      flash[:error] = 'Could not log in to Shopify shop.'
	      redirect_to action: 'new'
	    end
	 end

end