class PostController < ApplicationController
  #Authentication before do these action
  before_filter :authenticate_user!, only: [:edit, :create, :update, :destroy]
  before_action :set_post, only: [:new_comment, :edit, :update, :destroy]


  def like
    @post = current_user.post.new
    @post.post_type ="status"

    @status = Status.new(status_params)
    @status.post = @post

    respond_to do |format|
      
      if @status.save

        format.js {}
        format.html { redirect_to root_path }
        format.json { render :show, status: :created, location: @line_item }
      else
        format.html { render :new }
        format.json { render json: @line_item.errors, status: :unprocessable_entity }
      end
    end
  end


  

  def new_comment
    comment_content = params[:content]

    @new_comment = @post.comment.new(:content => comment_content)
    @new_comment.user = current_user

    respond_to do |format|
      
      if @new_comment.save

        format.js {}
        format.html { redirect_to root_path }
        format.json { render :show, status: :created, location: @line_item }
      else
        format.js {}
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
