class Post < ActiveRecord::Base
	has_one :status, foreign_key: :post_id
	belongs_to :owner,class_name: "User", foreign_key: :object_id
	default_scope  { order(created_at: :desc) }
	#validates_associated :status

	has_many :comment
	
	def createTime
		self.created_at
	end
end