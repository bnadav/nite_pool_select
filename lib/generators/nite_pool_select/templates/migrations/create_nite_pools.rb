class CreateNitePools < ActiveRecord::Migration
  def change
    create_table :nite_pools do |t|
      t.string :name
      t.string :description
      t.string :type
      t.integer :parent_id

      t.timestamps null: false
    end
    add_index :nite_pools, :name, :unique => true
    add_index :nite_pools, :parent_id, :unique => true
  end
end
