class CreateRelations < ActiveRecord::Migration
  def change
    create_table :relations do |t|
      t.integer :from_user
      t.integer :to_user
      t.integer :state

      t.timestamps null: false
    end
  end
end
