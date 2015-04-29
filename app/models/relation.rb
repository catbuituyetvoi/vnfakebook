class Relation < ActiveRecord::Base
	default_scope  { order(created_at: :desc) }
	
	belongs_to :from_user, class_name: "User", foreign_key: "from_user"
	belongs_to :to_user, class_name: "User", foreign_key: "to_user"
end
