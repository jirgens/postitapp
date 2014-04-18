class PostsController < ApplicationController
  before_action :set_post, only: [:show, :edit, :update]

  def index
    @posts = Post.all
  end

  def show
    @post = Post.find(params[:id])
  end

  def new
  	@post = Post.new
  end

  def create
    @post = Post.new(post_params)
    @post.creator = User.first #change once we have authentication
      if @post.save
        flash[:notice] = "Your post was saved."
        redirect_to posts_path
      else #validation error
        render :new
      end

  end

  def edit

  end

  def update

    if @post.update(post_params)
      flash[:notice] = "The post was updated"
      redirect_to posts_path
    else
      render :edit
    end
  end

  private

  def post_params
    params.require(:post).permit!
  end

  def before_action
    @post = Post.find(params[:id])
  end
end
