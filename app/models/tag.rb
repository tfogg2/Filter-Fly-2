class Tag < ApplicationRecord
  belongs_to :product_type

  has_many :product_tags, :dependent => :destroy
  has_many :products, :through => :product_tags
  validates :title, presence: true

  before_save :update_handle

	def update_handle
    	self.handle = title.parameterize
  	end
end
