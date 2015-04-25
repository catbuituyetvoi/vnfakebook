class HomeController < ApplicationController
  def index
 		if !current_user
 			render "home/guest"
 			return
 		end

 		@status = Status.new
 		@post = current_user.post
  end
end
