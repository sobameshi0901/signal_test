class ShopsController < ApplicationController
  before_action :set_shop, only: [:edit, :update, :show]
  # コントローラの処理を実行する前に決められたメソッドを実行。ここでは引数の:set_shopを使用し、@shopにインスタンスを代入
  before_action :user_login?
  # ユーザーがログインしていなければ全てのshop機能が使用不可。
  # ログインページへとリダイレクトする。

  # 新規店舗情報登録or店舗検索へのリンクページ。これがルートパスとなる。
  def index
    # indexビューへの遷移のみ
  end

  # 店舗詳細ページを表示
  def show
    # before_actionの:set_shopで@shopにインスタンスを代入。
    # これを基にshowビューを表示
  end

  # 店舗情報登録ページを表示
  def new
    @shop = Shop.new
    # form_forを使用する為、インスタンス変数@shopにShopのインスタンス（中身は空）を代入
  end

  # 店舗情報の登録処理
  def create
    @shop = Shop.new(shop_params)
    # Shopクラスのインスタンスを作成。引数にshop_paramsを入れることで、このデータ（フォームから送られてきた情報）をインスタンスのプロパティとして設定。@shopに代入
    if @shop.save
      # 上で作成して情報を登録したインスタンスをsaveメソッドでDBに保存。この時にバリデーションが行われ、条件に当てはまらない場合はfalseとなり、保存がされない。
      redirect_to @shop
      # shopコントローラのshowメソッドに@shopのidを引数として渡し、リダイレクトする。
      flash[:notice] = "店舗情報が登録されました"
      # フラッシュメッセージを表示
    else
      render 'new'
      # 保存に失敗した場合にはそのままnewアクションのビューをrenderする。@shopの内容は保持しているので、そのままビューに反映される。
    end
  end

  # 店舗情報編集ページを表示
  def edit
    # before_actionの:set_shopで@shopにインスタンスを代入。
    # これを基にeditビューを表示。
  end

  # 店舗情報を更新
  def update
    if @shop.update(shop_params)
      # 基本的にはcreateアクションと同じ。before_actionで@shopに代入されたインスタンスのプロパティをshop_paramsの内容に沿って更新。この時にもバリデーションが掛かる。
      redirect_to @shop
      # showアクションへリダイレクト
      flash[:notice] = "店舗情報が更新されました"
    else
      render 'edit'
      # editのビューをレンダー。@shopの内容は保持しているので、そのままビューに表示される。
    end
  end

  # 店舗を検索
  def search
    @shops = Shop.where('name LIKE(?)', "%#{params[:keyword]}%").order(updated_at: "DESC")
    # パラメータで送られてきた:keywordを引数にwhereメソッドを利用しDBのレコードを検索。該当するレコードに対応するインスタンスを@shopsに配列の形で代入。
    # さらにorderメソッドを条件である更新日時の降順を引数として実行。配列の順番を並べ替える
    if @shops.empty?
      flash.now[:danger] = "該当する店舗はありません。別のキーワードで検索してください。"
      # 該当するデータがなかった場合にはフラッシュメッセージを表示。
    end
  end

   # このクラス内部からのみ使用可能なprivateメソッドの定義
  private
  # ストロングパラーメータの定義
   def shop_params
    params.require(:shop).permit(:name, :address, :phone,:email, :image)
    # user_controllerと同じ仕組み
        # ストロングパラメータで送られてきたパラメータのうち必要なものだけをハッシュ型で取得
      # まずはrequireで:shopを引数にすることで、パラメータのうち、:userというキーに入ったハッシュだけを返り値として取得
      # そのうちで登録に必要な:emailと:passwordを引数に、permitメソッドを利用し、{'name: 'ユーザー入力値', 'address: 'ユーザー入力値'....}というハッシュ形式で帰ってくる。
    end

    # 店舗情報をインスタンスに保存
    def set_shop
      @shop = Shop.find(params[:id])
      # url中のparams[:id]を引数にfindメソッドを実行。そのidを持ったShopのインスタンスを代入。viewに表示させる。
    end

    # ログインの有無を確認。
    def user_login?
        redirect_to controller: 'sessions', action: 'new' unless logged_in?
    end
    # sessionヘルパーのlogged_in?メソッドを使い、falseであれば（ログインしていなければ）ログイン画面へリダイレクトする

end
