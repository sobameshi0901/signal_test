class User < ApplicationRecord
  validates :email, presence: true
  # バリデーション用メソッド。引数に(:email, presence: true)をとる。
  # レコードを作成・編集する際にemailが入力されていなければfalseが帰ってきて、反映がされない。
end
