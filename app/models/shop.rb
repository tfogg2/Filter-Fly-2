class Shop < ActiveRecord::Base
  include ShopifyApp::Shop
  include ShopifyApp::SessionStorage

  has_many :collections, dependent: :destroy

  	def find_or_create_by(collection)
		# collection is response from shopify api
		c = collections.find_by_shopify_collection_id(c.id)
		return c if c

		Rails.logger.debug("Collection: #{collection}")

		collections.create(
			title: collection[:title],
			shopify_collection_id: collection.id #[:id], # Dont know what the actual id is called
		)
	end
end
