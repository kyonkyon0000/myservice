class PostsController < ApplicationController

  def index #投稿一覧
    @posts = Post.all.order(created_at: :desc)
  end

  def show #投稿詳細表示
    @post = Post.find_by(id: params[:id])
  end

  def new #新規投稿画面
    @post = Post.new #空のインスタンスを作成
  end

  def create #投稿ボタン押下時
    #インスタンスを作成(contentフォームから送られてきたデータをcontentカラムに入れる)
    @post = Post.new(content: params[:content]) # "content" => params[:content]
    if @post.save #DBに保存できたら
      flash[:notice] = "投稿しました" #フラッシュを作成
      redirect_to("/posts/index") #上記動作後に投稿一覧画面に遷移
    else
      render("posts/new")
    end

  end

end
