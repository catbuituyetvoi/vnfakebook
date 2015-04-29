class AddObjectIdToUser < ActiveRecord::Migration
  def change
    add_column :users, :object_id, :integer
  end
end
