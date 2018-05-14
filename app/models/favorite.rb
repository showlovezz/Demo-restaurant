class Favorite < ApplicationRecord

	# 「收藏記錄」屬於使用者，也屬於餐廳
	belongs_to :user
	belongs_to :restaurant, counter_cache: true

end
