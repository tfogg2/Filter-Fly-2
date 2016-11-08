class Category < ApplicationRecord
	has_many :product_types, :dependent => :destroy
	has_many :products, :dependent => :destroy
end
