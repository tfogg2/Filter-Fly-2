class CreateTags < ActiveRecord::Migration[5.0]
  def change
    create_table :tags do |t|
      t.references :product_type, foreign_key: true
      t.string :title
      t.string :handle

      t.timestamps
    end
  end
end
