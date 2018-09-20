class Shop < ApplicationRecord
  mount_uploader :image, ImagesUploader
  # Shopの:imageに入った情報を指定のフォルダに保存し、そのパスをDBに保存する
end
