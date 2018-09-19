class User < ApplicationRecord
  VALID_EMAIL_REGEX = /[\w_-]+@[\w_-]+\.[\w_-]/
  # emailの形式確認用定数。半角英数字(大文字含)、"_"、"\"、"."のいずれかで@を挟んでいればOK
  validates :email, presence: true, format: {with: VALID_EMAIL_REGEX}, uniqueness: true
  # バリデーション用メソッド。引数に(:email, presence: true, format: {with VALID_EMAIL_REGEX}, uniqueness: true)をとる。
  # レコードを作成・編集する際に
  # (1)emailが入力されていない
  # (2)emailがVALID_EMAIL_REGEXの型になっていない
  # (3)既に同じ emailが存在する
  # のいずれかに当てはまるとfalseが帰ってきて、反映がされない。

  VALID_PASS_REGEX = /[\w]+/
  validates :password, presence: true, format: {with: VALID_PASS_REGEX}
  # 基本機能はemailと同じ

  has_secure_password
  # 以下の機能が追加される
  # ユーザーが入力したパスワードをハッシュ化してDB内password_digestに保存
  # 仮想的な属性 (passwordとpassword_confirmation) が使えるようになる。これらの一致するかどうかのバリデーションも追加される
  # authenticateメソッドが使えるようになる(引数の文字列がパスワードと一致するとUserオブジェクトを、間違っているとfalseを返すメソッド)
end
