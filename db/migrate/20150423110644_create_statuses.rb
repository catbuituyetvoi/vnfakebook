class CreateStatuses < ActiveRecord::Migration
  def change
    create_table :statuses do |t|
      t.belongs_to :post, index: true
      t.text :content

      t.timestamps null: false
    end
    add_foreign_key :statuses, :posts
  end
end
