class PostsController < ApplicationController
  #投稿一覧
  def index
    @posts = Post.all.order(created_at: :desc)
  end

  #投稿詳細表示
  def show
    @post = Post.find_by(id: params[:id])
  end

  #新規投稿画面
  def new
    @post = Post.new #空のインスタンスを作成
  end

  #投稿ボタン押下時
  def create
    #インスタンスを作成(contentフォームから送られてきたデータをcontentカラムに入れる)
    @post = Post.new(content: params[:content]) # "content" => params[:content]
    if @post.save #DBに保存できたら
      flash[:notice] = "投稿しました" #フラッシュを作成
      redirect_to("/posts/index") #上記動作後に投稿一覧画面に遷移
    else
      #newアクションを飛ばしてnew.html.erbに遷移
      render("posts/new") #new.htmlでcreateアクションの@postが使えるようになる
    end
  end

  #編集画面
  def edit
    #データベースから該当するidのデータを取ってくる
    @post = Post.find_by(id: params[:id])
  end

  #編集ボタン押下時
  def update
    #データベースから該当するidのデータを取ってくる
    @post = Post.find_by(id: params[:id])
    #撮ってきたデータに編集データを入れる
    @post.content = params[:content]
    if @post.save
      flash[:notice] = "投稿を編集しました"
      redirect_to("/posts/index")
    else
      #editアクションを飛ばしてedit.html.erbに遷移
      render("posts/edit") #edit.htmlでupdateアクションの@postが使えるようになる
    end
  end

  #削除ボタン押下時
  def destroy
    @post = Post.find_by(id: params[:id])
    @post.destroy
    flash[:notice] = "投稿を削除しました"
    redirect_to("/posts/index")
  end

end
