class User < ApplicationRecord
  VALID_EMAIL_REGEX = /[\w_-]+@[\w_-]+\.[\w_-]/
  # emailの形式確認用定数。半角英数字(大文字含)、"_"、"\"、"."のいずれかで@を挟んでいればOK
  validates :email, presence: true,uniqueness: true
  validates :email, format: {with: VALID_EMAIL_REGEX}, allow_blank: true
  # バリデーション用メソッド。それぞれ第一引数に属性名を、それ以降の引数に条件にをとる。
  # レコードを作成・編集する際に
  # (1)emailが入力されていない
  # (2)既に同じ emailが存在する
  # (3)emailがVALID_EMAIL_REGEXの型になっていない
  # のいずれかに当てはまるとfalseが帰ってきて、反映がされない。
  # :emailに対してvalidatesを２回行っているのは、空の場合に:presenceと:format両方のエラーメッセージが表示されるのを防ぐため

  VALID_PASS_REGEX = /[\w]+/
  validates :password, presence: true, format: {with: VALID_PASS_REGEX}, allow_nil: true
  # 基本機能はemailと同じ
  # allow_nil: true はnilでも問題なく通す。 nil の場合は下のhas_secure_passwordでnil: false のバリデーションが掛かっているため、こちらでもかけるとエラーメッセージが二重となるため。

  has_secure_password
  # 以下の機能が追加される
  # ユーザーが入力したパスワードをハッシュ化してDB内password_digestに保存
  # 仮想的な属性 (passwordとpassword_confirmation) が使えるようになる。これらの一致するかどうかのバリデーションも追加される
  # authenticateメソッドが使えるようになる(引数の文字列がパスワードと一致するとUserオブジェクトを、間違っているとfalseを返すメソッド)
end
