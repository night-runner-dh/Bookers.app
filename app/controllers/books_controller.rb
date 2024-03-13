class BooksController < ApplicationController
  def new
    # Viewへ渡すためのインスタンス変数に空のModelオブジェクトを生成する。
    @list = List.new
  end
  
 def create
    # １.&2. データを受け取り新規登録するためのインスタンス作成
    @list = List.new(list_params)
    # 3. データをデータベースに保存するためのsaveメソッド実行
    if @list.save
      flash[:notice] = "投稿に成功しました。"

    
    # 4. トップ画面へリダイレクト
       redirect_to book_path(@list.id)
    else
    # 3. フラッシュメッセージを定義し、new.html.erbを描画する
       flash[:alert] = "投稿に失敗しました。" #キーをalertに変更
       #render :index
       redirect_to "/books"
    end
 end


  def index
     @list = List.new
     @lists = List.all
  end

  def show
    @list = List.find(params[:id])
  end

  def edit
    @list = List.find(params[:id])
  end
  
  def update
    list = List.find(params[:id])
    list.update(list_params)
    redirect_to book_path(list.id)
  end
  
  def destroy
    list = List.find(params[:id])  # データ（レコード）を1件取得
    list.destroy  # データ（レコード）を削除
    redirect_to '/books'  # 投稿一覧画面へリダイレクト  
  end
  
  private
  # ストロングパラメータ
  def list_params
    params.require(:list).permit(:title, :body)
  end
  
end