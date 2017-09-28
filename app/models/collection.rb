class Collection < ApplicationRecord
	belongs_to :shop
	has_many :categories, dependent: :destroy

	def find_or_create_collection(collection)
		# collection is response from shopify api
		c = collections.find_by_shopify_collection_id(c.id)
		return c if c

		#Rails.logger.debug("Collection: #{collection}")

		collections.create(
			title: collection[:title],
			shopify_collection_id: collection.id #[:id], # Dont know what the actual id is called
		)
	end

	def as_json
		{
			id: id,
			title: title,
			categories: categories.as_json
		}
	end


	def @custom_collections.search(search)
		if search
			where('title iLIKE ?', "%#{search}%").order("name ASC")
		else
			all
		end
	end
	def @smart_collections.search(search)
		if search
			where('title iLIKE ?', "%#{search}%").order("name ASC")
		else
			all
		end
	end
end
