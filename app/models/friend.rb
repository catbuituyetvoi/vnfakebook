class Friend < ActiveRecord::Base
	belongs_to :from_user, class_name: "User", foreign_key: "from_user"
	belongs_to :to_user, class_name: "User", foreign_key: "to_user"
end
