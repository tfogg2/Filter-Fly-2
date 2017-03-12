class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  before_action :set_shopify_collection_id

  #before_action :logger

  

  def set_shopify_collection_id
  	if !params[:shopify_collection_id].blank?
  		session[:shopify_collection_id] = params[:shopify_collection_id]
  	end
  	
  	if !params[:shopify_collection_title].blank?
  		session[:shopify_collection_title] = params[:shopify_collection_title]
  	end
  end

  def clear_shopify_collection_id
  	session[:shopify_collection_id] = nil
  	session[:shopify_collection_title] = nil
  end

  def set_shop
    # This needs to look the shop up by it's store name? url?
    # @shop = blah
  end
  
  #def logger
   # Rails.logger.debug("///set_shopify_collection_id: #{session[:shopify_collection_id]}")
  #end
end
