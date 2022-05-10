class PostsController < ApplicationController
  def index
    @post = Post.all.order(created_at: :desc)
  end

  def new; end

  def create
    @post = Post.new(name: params[:name], text: params[:text])
    @post.save
    if @post.save
      flash[:notice] = "#{@post.name}さんの投稿を保存しました。"
      redirect_to('/')
    else
      render('posts/new')
    end

  end

  def edit
    @post = Post.find_by(id: params[:id])
  end

  def update
    @post = Post.find_by(id: params[:id])
    @post.name = params[:name]
    @post.text = params[:text]
    @post.save
    if @post.save
      redirect_to('/')
    else
      render('posts/edit')
    end
  end

  def destroy
    @post = Post.find_by(id: params[:id])
    @post.destroy
    redirect_to('/')
  end
end
