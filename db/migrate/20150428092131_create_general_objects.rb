class CreateGeneralObjects < ActiveRecord::Migration
  def change
    create_table :general_objects do |t|
      t.string :object_type

      t.timestamps null: false
    end
  end
end
