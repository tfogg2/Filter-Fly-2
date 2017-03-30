class Shop < ActiveRecord::Base
  include ShopifyApp::Shop
  include ShopifyApp::SessionStorage

  has_many :collections, dependent: :destroy

  def self.store(session)
   	shop = Shop.new(domain: session.url, token: session.shopify_token) #session.url
  	shop.save!
   	shop.id
  end

  def self.retrieve(id)
  	# return if id.blank?
   	shop = Shop.find(id)
   	ShopifyAPI::Session.new(shop.shopify_domain, shop.shopify_token)
  end
  def with_shopify!
	session = ShopifyAPI::Session.new(shopify_domain, shopify_token)
	ShopifyAPI::Base.activate_session(session)
  end

  	def find_or_create_collection(collection)
		# collection is response from sohpify api
		c = collections.find_by_shopify_collection_id(collection.id)
    	Rails.logger.debug("Found existing collection (#{collection.class.name}): #{c.title}") if c
		return c if c

		Rails.logger.debug("No collection yet for this shopify collection: #{collection.inspect}")

		collections.create(
			title: collection.title,
			shopify_collection_id: collection.id #[:id], # Dont know what the actual id is called
		)
	end
end
