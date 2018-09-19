class User < ApplicationRecord
  VALID_EMAIL_REGEX = ^[a-zA-Z0-9-_\.]+@[a-zA-Z0-9-_\.]+$
  # emailの形式確認用定数。半角英数字(大文字含)、"_"、"\"、"."のいずれかで@を挟んでいればOK
  validates :email, presence: true, format: {with: VALID_EMAIL_REGEX}, unique: true
  # バリデーション用メソッド。引数に(:email, presence: true, format: {with VALID_EMAIL_REGEX})をとる。
  # レコードを作成・編集する際に
  # (1)emailが入力されていない
  # (2)emailがVALID_EMAIL_REGEXの型になっていない
  # (3)既に同じ emailが存在する
  # のいずれかに当てはまるとfalseが帰ってきて、反映がされない。


end
