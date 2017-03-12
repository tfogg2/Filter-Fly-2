class AddCollectionIdToCategory < ActiveRecord::Migration[5.0]
  def change
    add_column :categories, :collection_id, :string
  end
end
