class Post < ActiveRecord::Base
	has_one :status,foreign_key: :post_id

	#validates_associated :status

end