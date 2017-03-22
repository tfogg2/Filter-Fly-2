class Api::BaseController < ApplicationController
	before_action :set_shop
  	#skip_before_action :set_shopify_collection_id
  def set_shop
    @shop = Shop.find_by_shopify_domain(params[:shop])
  end
end
