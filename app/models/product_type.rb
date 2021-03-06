class ProductType < ApplicationRecord
  belongs_to :category
  has_many :tags, :dependent => :destroy
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
			tags: tags.as_json
		}
	end
end
