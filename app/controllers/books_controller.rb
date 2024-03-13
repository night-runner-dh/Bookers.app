class BooksController < ApplicationController
  def new
    # Viewへ渡すためのインスタンス変数に空のModelオブジェクトを生成する。
    @book = List.new  
  end
 def create
    # １.&2. データを受け取り新規登録するためのインスタンス作成
    @book = List.new(list_params)
    # 3. データをデータベースに保存するためのsaveメソッド実行
    @book.save
    # 4. トップ画面へリダイレクト
    redirect_to '/top'
 end


  def index
    
  end

  def show
  end

  def edit
  end
end

  private
  # ストロングパラメータ
  def list_params
    params.require(:list).permit(:title, :body)
  end