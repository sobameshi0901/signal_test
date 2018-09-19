module SessionsHelper
  def log_in(user)
    session[:user_id] = user.id
    # railsで定義されたsessionメソッドに引数のuserインスタンスのidを保存
  end
end
