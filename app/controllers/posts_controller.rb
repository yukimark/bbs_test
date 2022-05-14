class PostsController < ApplicationController
  def index
    @posts = Post.all.order(created_at: :desc)
  end

  def new
    @post = Post.new
  end

  def create
    @post = posts.new(post_params)

    begin
      @post.save!
      redirect_to root_path, notice: t('post_new_success', { name: @post.name })
    rescue ActiveRecord::RecordInvalid => e
      @error = e
      render :new
    end
  end

  def edit
    @post = Post.find(params[:id])
  end

  def update
    @post = Post.find(params[:id])
    @post.name = post_params[:name]
    @post.text = post_params[:text]

    begin
      @post.save!
      redirect_to root_path, notice: t('post_edit_success', { name: @post.name })
    rescue ActiveRecord::RecordInvalid => e
      @error = e
      render :edit
    end
  end

  def destroy
    @post = Post.find(params[:id])
    @post.destroy
    redirect_to root_path, notice: t('post_destroy_success')
  end

  private

  def post_params
    params.require(:post).permit(:name, :text)
  end
end
