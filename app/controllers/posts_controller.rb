class PostsController < ApplicationController
  helper_method :post

  def index
    @posts = Post.all
  end

  def show
  end

  def new
    @post = Post.new
  end

  def edit
  end

  def create
    @post = Post.create(post_params)
  end

  def update
    post.update(post_params)
  end

  def destroy
    post.destroy!

    redirect_to root_path, notice: "Post was successfully destroyed.", status: :see_other
  end

  private

  def post
    @post ||= Post.find(params.expect(:id))
  end

  def post_params
    params.expect(post: [ :title, :content ])
  end
end
