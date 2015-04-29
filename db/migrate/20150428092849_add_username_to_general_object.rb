class AddUsernameToGeneralObject < ActiveRecord::Migration
  def change
    add_column :general_objects, :username, :string
  end
end
