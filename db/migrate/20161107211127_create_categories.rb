class CreateCategories < ActiveRecord::Migration[5.0]
  def change
    create_table :categories do |t|
      t.string :title
      t.string :handle
      t.string :shopify_collection_id

      t.timestamps
    end
  end
end
