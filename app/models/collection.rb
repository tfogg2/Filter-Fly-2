class Collection < ApplicationRecord
	belongs_to :shop
	has_many :categories, dependent: :destroy

	def as_json
		{
			id: id,
			title: title,
			categories: categories.as_json
		}
	end
end