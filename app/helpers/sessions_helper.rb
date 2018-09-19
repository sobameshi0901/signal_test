module SessionsHelper
  # これらは他のコントローラでも使用するため、モジュールとして作成し、application.controllerにincludeする
  def log_in(user)
    session[:user_id] = user.id
    # railsで定義されたsessionメソッドに引数のuserインスタンスのidを保存
  end

  # 現在ログイン中のユーザーを返す
  def current_user
    if session[:user_id]
      @current_user ||= User.find_by(id: session[:user_id])
      # session[:user_id]がDB内のUserのidと一致すれば@current_userにそのインスタンスを返す。いなければnilを返す
    end
  end

  # ユーザーがログインして入ればtrue、その他はfalseを返す
  def logged_in?
    !current_user.nil?
  end

  def log_out
    session.delete(:user_id)
    # session[:user_id]を消去
    @current_user = nil
    # current_userもnilに変更
  end
end
