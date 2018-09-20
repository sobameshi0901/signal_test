class Shop < ApplicationRecord
  mount_uploader :image, ImagesUploader
  # Shopの:imageに入った情報を指定のフォルダに保存し、そのパスをDBに保存する
  validates :name, presence: true, uniqueness: true
  # バリデーション用メソッド。
  # 引数にフォームから送られてきた:name, 条件であるpresence:true及びuniquness: trueを入れている。フォームに値が入っていなかった場合、既に店舗名が存在する場合のいずれかもしくは両方に当てはまる場合falseを返し、登録ができない。
    VALID_EMAIL_REGEX = /[\w_-]+@[\w_-]+\.[\w_-]/
  # emailの形式確認用定数。半角英数字(大文字含)、"_"、"\"、"."のいずれかで@を挟んでいればOK
  validates :email, format: {with: VALID_EMAIL_REGEX},allow_blank: true
  # バリデーション用メソッド。フォームから送られてきた:emailがVALID_EMAIL_REGEXの型になっていない場合falseを返し、登録ができない
  validates :phone, presence:true, length: { is: 11}
  # バリデーション用メソッド
  # フォームが空である場合、文字数が11文字以外の場合のいずれかもしくは両方に当てはまる場合falseを返し、登録ができない
  validates :image, presence: true
  # バリデーション用メソッド
  # フォームが空である場合falseを返し、登録ができない
end
