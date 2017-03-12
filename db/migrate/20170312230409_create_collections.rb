class CreateCollections < ActiveRecord::Migration[5.0]
  def change
    create_table :collections do |t|
      t.string :shop_id
      t.string :title
      t.string :shopify_collection_id

      t.timestamps
    end
  end
end
