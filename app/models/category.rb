class Category < ApplicationRecord
	has_many :product_types, :dependent => :destroy
	has_many :products, :dependent => :destroy

	before_save :update_handle

	def update_handle
    	self.handle = title.parameterize
  	end
end
