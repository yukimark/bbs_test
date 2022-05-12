class PostsController < ApplicationController
  def index
    @post = Post.all.order(created_at: :desc)
  end

  def new; end

  def create
    @post = Post.new(post_params)

    begin
      @post.save!
      flash[:notice] = t('post_new_success', { name: @post.name })
      redirect_to root_path
    rescue ActiveRecord::RecordInvalid => e
      logger.debug(e)
      flash[:notice] = t('post_new_failed')
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
      flash[:notice] = t('post_edit_success', { name: @post.name })
      redirect_to root_path
    rescue ActiveRecord::RecordInvalid => e
      logger.debug(e)
      flash[:notice] = t('post_edit_failed')
      render :edit
    end
  end

  def destroy
    @post = Post.find(params[:id])
    @post.destroy
    flash[:notice] = t('post_destroy_success')
    redirect_to root_path
  end

  private

  def post_params
    params.permit(:name, :text)
  end
end
