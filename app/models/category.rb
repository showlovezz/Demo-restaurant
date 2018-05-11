class Category < ApplicationRecord

	# 如果分類下已有餐廳，就不允許刪除分類（刪除時拋出 Error）
	has_many :restaurants, dependent: :restrict_with_error

	# Category Model 驗證 name 必填
	validates_presence_of :name

	# 確定新增的餐廳分類名稱不會重複現有的餐廳分類
	validates_uniqueness_of :name

end
