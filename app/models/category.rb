class Category < ApplicationRecord

	# 設定 Model 關聯
	has_many :restaurants, dependent: :destroy

	# Category Model 驗證 name 必填
	validates_presence_of :name

	# 確定新增的餐廳分類名稱不會重複現有的餐廳分類
	validates_uniqueness_of :name

end
