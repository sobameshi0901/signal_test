class SessionsController < ApplicationController
  def new
  end

  def create
    user = User.find_by(email: params[:session][:email])
    # フォームから送られてきた情報(email)を引数にfind_byメソッドを行い、返ってきたUserのインスタンスをuserに代入
    if user && user.authenticate(params[:session][:password])
    # userが存在する（フォームのemailアドレスを持ったユーザーがいる）かつ
    # passwordが正しければ(フォームに入力されたpasswordを引数にauthenticateメソッドでハッシュ化し、userのpasswordと照合すれば)trueが返されif文はtrueとなる 
      log_in user
      # sessionのヘルパーメソッドlog_inをuserを引数に実行。session[:user_id]にuser.idが保存される
      redirect_to new_user_url
    else
      flash.now[:danger] = 'メールアドレスとパスワードの組み合わせが一致しません'
      render 'new'
    end
  end

  def destroy
  end
end
