class StatusController < ApplicationController
  #Authentication before do these action
  before_filter :authenticate_user!, only: [:edit, :create, :update, :destroy]
  before_action :set_post, only: [:edit, :update, :destroy]

  def edit
  end

  def create
    @post = current_user.post.new
    @post.post_type ="status"
    @status = @post.build_status(status_params)

    respond_to do |format|
      if @post.save
        format.js {}
        format.html { redirect_to root_path }
        format.json { render :show, status: :created, location: @line_item }
      else
        format.html { render :new }
        format.json { render json: @line_item.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    @post.update(post_params)
    respond_with(@post)
  end

  def destroy
    @post.destroy
    respond_with(@post)
  end

  private
    def set_post
      @post = Post.find(params[:id])
    end

    def status_params
      params.require(:status).permit(:content)
    end
end
