class Restaurant < ApplicationRecord
	
	# 驗證名稱，必須必填
	validates_presence_of :name

	# 上傳照片
	mount_uploader :image, PhotoUploader

	# 設定 Model 關聯
	belongs_to :category, optional: true

end
