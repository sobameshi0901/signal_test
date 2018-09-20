class UsersController < ApplicationController
  def new
    @user = User.new
    # form_for を使用するため、変数にUserインスタンスを代入。
  end

  def create
    @user  = User.new(user_params)
    # Userクラスのインスタンスを作成。引数にuser_paramsを入れることで、user_paramsのデータ(permitされたフォームから送られた情報)をインスタンスのプロパティとして登録
    if @user.save
      # 上で作成して情報を登録したインスタンスをsaveメソッドでDBに保存。この時にバリデーションが行われ、条件に当てはまらない場合はfalseとなり保存されない。このDBで保存する際に、has_secure_passwordによってパスワードはハッシュ化される。
      log_in @user
      # @userを引数にsessionヘルパーのlog_inメソッドでlog_inする(session[:user_id]に保存)
      flash[:notice] = "登録が完了しました"
    else
      render 'new'
      # 保存が失敗した場合には、エラーメッセージを表示。
      # エラーメッセージはuser.erros.full_messageオブジェクトに配列で保存される
      # renderはインスタンスの情報をそのままViewに渡すので、エラーメッセージはビューでそれを取り出す処理をしておけば良い。
    end
  end

  private
  # このクラス内部からのみ使用可能なprivateメソッドの定義
    def user_params
      params.require(:user).permit(:email, :password)
      # ストロングパラメータで、送られてきたパラメータのうち必要な:emailと:passwordのみを許可、ハッシュ型で取得
      # まずはrequireで:userを引数にすることで、パラメータのうち、:userというキーに入ったハッシュだけを返り値として取得
      # そのうちで登録に必要な:emailと:passwordを引数に、permitメソッドを利用し、{'email: 'ユーザー入力値', 'password: 'ユーザー入力値'}という形で帰ってくる。
    end
end
