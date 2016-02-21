class CreateNitePools < ActiveRecord::Migration
  def change
    create_table :nite_pools do |t|
      t.string :name
      t.string :description
      t.string :type
      t.boolean :with_dependencies
      t.integer :parent_id

      t.timestamps null: false
    end
  end
end
