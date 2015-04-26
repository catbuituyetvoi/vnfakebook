class ProfileController < ApplicationController
	rescue_from ActiveRecord::RecordNotFound, with: :record_not_found
 
 	layout "landing", only: [:show, :getting_started]
	#Getting started After Registration
 	def getting_started
 	
 	end

  def show()
  	@user = User.find(params[:id])
  end

  def upload_avatar
  	current_user.image = params[:user][:image]
  	current_user.save

  	if current_user.save
  		redirect_to root_path
  	else
  	end
  end

  private
  def record_not_found
    render "error/userNotFound", layout: 'landing'
 	end
end
