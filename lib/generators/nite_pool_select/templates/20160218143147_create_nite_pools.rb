class CreateNitePools < ActiveRecord::Migration
  def change
    create_table :nite_pools do |t|
      t.string :name
      t.string :description
      t.string :element_type

      t.timestamps null: false
    end
  end
end
