class GeneralObject < ActiveRecord::Base
	has_one :user, foreign_key: "object_id"
end
