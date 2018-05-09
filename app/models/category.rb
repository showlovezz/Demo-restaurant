class Category < ApplicationRecord

	# 設定 Model 關聯
	has_many :restaurants, dependent: :destroy

	# Category Model 驗證 name 必填
	validates_presence_of :name

end
