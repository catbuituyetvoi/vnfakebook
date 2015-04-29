class RelationController < ApplicationController
	before_action :set_user, only: [:get_friend_list, :send_friend_request, :accept_friend_request, :follow_user]


  def get_friend_list
    @friend = @user.get_friend_list
  end


  def send_friend_request
  	Relation.find_or_create_by!("from_user" => current_user,"to_user" => @user)
    #Important, if User privacy allow Followable
    Friend.find_or_create_by!("from_user" => current_user,"to_user" => @user, "follow" => 1)
  end
  

  #Set state to 1 if, and become Friend
  def accept_friend_request
  	@friend_request = Relation.find(params[:id])
  	Friend.create("from_user" => current_user,"to_user" => @user, "follow" => 1,"friend" => 1)

    @friend_update = Friend.where("from_user = ? and to_user = ?", @user, current_user).take
    @friend_update.friend = 1
    @friend_update.save

  	respond_to do |format|

	  	if @friend_update.save!
          @friend_request.destroy

	        format.js {}
	        format.html { redirect_to root_path }
	    else
	        format.html { render :new }
	        format.json { render json: @request.errors, status: :unprocessable_entity }
	    end
	  end

  end

  #deny a friend request, destroy this request from Relation
  def deny_friend_request
  	@request = Relation.find(params[:id])

  	respond_to do |format|

	  	if @request.destroy
	        format.js {}
	    else
	        format.html { render :new }
	        format.json { render json: @request.errors, status: :unprocessable_entity }
	    end
	  end
  end

  def follow_user
      @follow = Friend.where("from_user = ? and to_user = ?",current_user , @user ).take

      @action = true

      if @follow.blank?
        @follow = Friend.create!("from_user" => current_user,"to_user" => @user, "follow" => 1)
      
      elsif @follow.follow == 1
        @follow.follow = 0
        @action = false
      
      else
        @follow.follow = 1
      end
      
      respond_to do |format|

      if @follow.save!
          format.js {}
      else
          format.html { render :new }
          format.json { render json: @request.errors, status: :unprocessable_entity }
      end
    end

  end

  private
    def set_user
      @user = User.find(params[:id])
    end

end
