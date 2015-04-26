class CreatePosts < ActiveRecord::Migration
  def change
    create_table :posts do |t|
      t.integer :object_id
      t.string :post_type

      t.timestamps null: false
    end
  end
end
