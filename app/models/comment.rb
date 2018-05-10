class Comment < ApplicationRecord

	# 評論屬於某位使用者
	belongs_to :user

	# 評論屬於某家餐廳
	belongs_to :restaurant

end
