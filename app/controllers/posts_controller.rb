class PostsController < ApplicationController
  def index
    @post = Post.all.order(created_at: :desc)
  end

  def new; end

  def create
    @post = Post.new(name: params[:name], text: params[:text])
    # @post.save
    # if @post.save
    #   flash[:notice] = "#{@post.name}さんの投稿を保存しました。"
    #   redirect_to('/')
    # else
    #   render('posts/new')
    # end
    # 間違えていたときのために残してる

    begin
      @post.save!
      flash[:notice] = "#{@post.name}さんの投稿を保存しました。"
      redirect_to('/')
    rescue ActiveRecord::RecordInvalid => e
      puts e
      flash[:notice] = "#{@post.name}さんの投稿を保存できませんでした。"
    end

  end

  def edit
    @post = Post.find_by(id: params[:id])
  end

  def update
    @post = Post.find_by(id: params[:id])
    @post.name = params[:name]
    @post.text = params[:text]
    # if @post.save
    #   flash[:notice] = "#{@post.name}さんの投稿を編集しました。"
    #   redirect_to('/')
    # else
    #   render('posts/edit')
    # end
    # 残しておく

    begin
      @post.save!
      flash[:notice] = "#{@post.name}さんの投稿を編集しました。"
      redirect_to('/')
    rescue ActiveRecord::RecordInvalid => e
      puts e
      flash[:notice] = "#{@post.name}さんの投稿を編集できませんでした。"
    end
  end

  def destroy
    @post = Post.find_by(id: params[:id])
    @post.destroy
    if @post.destroy
      flash[:notice] = "投稿を削除しました。"
    end
    redirect_to('/')
  end
end
