class Product < ApplicationRecord
  belongs_to :product_type, required: false
  belongs_to :category, required: false

  has_many :product_tags, :dependent => :destroy
  has_many :tags, :through => :product_tags


  def self.create_products_for_shopify(shopify_products = [])
  	return false if shopify_products.empty?

  	shopify_products.each do |p|
  		product = Product.find_by_shopify_product_id(p.id)
		  Product.create(:shopify_product_id => p.id) if !product
    end
  end
end
