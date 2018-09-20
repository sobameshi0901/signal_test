class SessionsController < ApplicationController
  def new
  end

  def create
    user = User.find_by(email: params[:session][:email])
    # フォームから送られてきたパラメータの情報(:email)を引数にfind_byメソッドを行い、返ってきたUserのインスタンスをuserに代入
    if user && user.authenticate(params[:session][:password])
    # userが存在する（フォームのemailアドレスを持ったユーザーがいる）かつ
    # passwordが正しければ(フォームに入力されたpasswordを引数にauthenticateメソッドを実行、userのpasswordと合致すれば)if文はtrueとなる
      log_in user
      # sessionのヘルパーメソッドlog_inをuserを引数に実行。session[:user_id]にuser.idが保存される
      redirect_to controller: 'shops', action: 'index'
      # リダイレクトメソッド, 遷移先のコントローラとアクションを引数。
    else
      # ユーザーのアドレスとパスワードが合致せずfalseとなった場合
      flash.now[:danger] = 'メールアドレスとパスワードの組み合わせが一致しません'
      render 'new'
    end
  end

  def destroy
    log_out
    # session[:user_id]を削除する
    redirect_to login_path
    # sessionコントローラのnewアクションへリダイレクト
  end
end
