class PostsController < ApplicationController

  def index
    @posts = Post.all.order(id: :desc).limit(50)
  end

  def create
    @post = Post.new(post_params)

    respond_to do |format|
      if @post.save
        format.js
      end
    end

    # render plain: params[:post].inspect
    # render plain: params.inspect
  end

  def show
    @post = Post.find(params[:id])
    # Put this inside respond_to format.js later if necessary to use show for
    # anything else.
    render :show, :layout => false
  end

  private
  def post_params
    params.require(:post).permit(:name, :text, :picture)
  end

end
