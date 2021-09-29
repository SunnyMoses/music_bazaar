class CreateStores < ActiveRecord::Migration[5.2]
  def change
    create_table :stores do |t|
      t.string :name
      t.string :category
      t.float :price
      t.string :model
      t.text :description

      t.timestamps
    end
  end
end
