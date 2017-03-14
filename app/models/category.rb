class Category < ApplicationRecord
	belongs_to :shopify_collection_id
	has_many :product_types, :dependent => :destroy
	has_many :products, :dependent => :destroy
	validates :title, presence: true

	before_save :update_handle

	def update_handle
    	self.handle = title.parameterize
  	end

  	def as_json
		{
			id: id,
			title: title,
			product_types: product_types.as_json
		}
	end
end
