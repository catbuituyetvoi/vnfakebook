class CreateFriends < ActiveRecord::Migration
  def change
    create_table :friends do |t|
      t.integer :from_user
      t.integer :to_user
      t.integer :notify
      t.integer :follow
      t.integer :friend

      t.timestamps null: false
    end
  end
end
