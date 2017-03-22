class Api::BaseController < ApplicationController

  skip_before_action :set_shopify_collection_id

end
