class Category < ApplicationRecord

	# 設定 Model 關聯
	has_many :restaurants, dependent: :destroy

end
