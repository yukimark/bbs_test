class PostsController < ApplicationController
  def index
    @post = Post.all.order(created_at: :desc)
  end

  def new; end

  def create
    @post = Post.new(name: params[:name], text: params[:text])
    # 大体のフォーム周りではsave!を使うことが多いです！
    # save!でエラーを出してrescue ActiveRecord::RecordInvalidでエラー出た時の処理を書くって感じですね
    # https://masterpiyo.hatenadiary.org/entry/20111212/1323677704
    @post.save
    # ここもsave!にすると書き方変わりそうですね
    if @post.save
      redirect_to('/')
    else
      render('posts/new')
    end
  end

  def edit
    # find_byでなくfind(params[:id])で良いかなって思いました！
    # find_byとfindの違い https://qiita.com/tsuchinoko_run/items/f3926caaec461cfa1ca3
    @post = Post.find_by(id: params[:id])
  end

  def update
    @post = Post.find_by(id: params[:id])
    # パラメーター周りは以下のサイトを参考にして書き直してみてください！
    # https://qiita.com/mokio/items/50f5ee5011bc423c36ae
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
