class ShopsController < ApplicationController
  def index
  end

  def show
  end

  def new
    @shop = Shop.new
    # form_forを使用する為、インスタンス変数にShopのインスタンス（中身は空）を代入
  end

  def create
    @shop = Shop.new(shop_params)
    # Shopクラスのインスタンスを作成。引数にshop_paramsを入れることで、このデータ（フォームから送られてきた情報を）インスタンスのプロパティとして登録
    if @shop.save
      # 上で作成して情報を登録したインスタンスをsaveメソッドでDBに保存。この時にバリデーションが行われる。
      redirect_to @shop
      falsh[:notice] = "店舗情報が登録されました"
    else
      render 'new'
    end
  end

  def edit
  end

  def search
  end

  private
   # このクラス内部からのみ使用可能なprivateメソッドの定義
   def shop_params
    params.require(:shop).permit(:name, :address, :phone,:email, :image)
    # user_controllerと同じ仕組み
        # ストロングパラメータで送られてきたパラメータのうち必要なものだけをハッシュ型で取得
      # まずはrequireで:shopを引数にすることで、パラメータのうち、:userというキーに入ったハッシュだけを返り値として取得
      # そのうちで登録に必要な:emailと:passwordを引数に、permitメソッドを利用し、{'name: 'ユーザー入力値', 'address: 'ユーザー入力値'....}というハッシュ形式で帰ってくる。
    end

end
