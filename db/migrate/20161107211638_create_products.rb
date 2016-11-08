class CreateProducts < ActiveRecord::Migration[5.0]
  def change
    create_table :products do |t|
      t.references :product_type, foreign_key: true
      t.references :category, foreign_key: true
      t.string :shopify_product_id

      t.timestamps
    end
  end
end
