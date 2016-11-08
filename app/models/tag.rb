class Tag < ApplicationRecord
  belongs_to :product_type

  has_many :product_tags, :dependent => :destroy
  has_many :products, :through => :product_tags
end
