class HomeController < ApplicationController
  def index
 		if !current_user
 			#Render guest then return
 			render "home/guest"
 			return
 		end

 		@status = Status.new

 		@feed = current_user.feed
 		
  end
end
