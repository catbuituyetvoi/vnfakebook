class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
         
  has_many :post, foreign_key: :object_id

  has_many :friend, class_name: "Friend",foreign_key: :from_user

  has_one :general_object, foreign_key: "object_id"
  #upload Image
  mount_uploader :image, ImageUploader

  has_many :active_relationships,  class_name:  "Friend", foreign_key: "from_user",dependent:   :destroy
  has_many :passive_relationships, class_name:  "Friend", foreign_key: "to_user",dependent:   :destroy
  has_many :following, through: :active_relationships,  source: :to_user
  has_many :followers, through: :passive_relationships, source: :from_user

  belongs_to :generalobject, foreign_key: :object_id



  def feed
    following_id_list = following.map(&:id)
    Post.where("object_id IN (?) OR object_id = ?", following_id_list, id)
  end

  
  def friendRequest
  	Relation.where("to_user = ?", self.id)
  end

  def follow_list
    Friend.where("from_user = ? and follow = 1", self.id)
  end

  def get_friend_list
    Friend.where("from_user = ? and is_friend = 1", self.id)
  end

  def is_following(id)
    Friend.where("from_user = ? and to_user = ? and follow = 1", self.id, id).exists?
  end

  def is_friend_with(id)
    Friend.where("from_user = ? and to_user = ? and is_friend = 1", self.id, id).exists?
  end

  def is_sent_request_to(id)
    Relation.where("from_user = ? and to_user = ?", self.id, id).exists?
  end

  def is_pending_request_from(id)
    Relation.where("from_user = ? and to_user = ?", id, self.id ).exists?
  end
end
