class CreateNitePoolMembers < ActiveRecord::Migration
  def change
    create_table :nite_pool_members do |t|
      t.string :membership_type
      t.integer :membership_id
      t.integer :pool_id
      t.string :name
      t.string :description

      t.timestamps null: false
    end
  end
end
