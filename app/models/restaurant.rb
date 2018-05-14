class Restaurant < ApplicationRecord
	
	# 驗證名稱，必須必填
	validates_presence_of :name

	# 上傳照片
	mount_uploader :image, PhotoUploader

	# 設定 Model 關聯
	belongs_to :category, optional: true

	# 避免刪除category後，後續顯示的部分會有問題
	delegate :name, to: :category, prefix: true, allow_nil: true

	# 當 Restaurant 物件被刪除時，順便刪除依賴的 Comment
	has_many :comments, dependent: :destroy

	has_many :favorites, dependent: :destroy
	has_many :favorited_users, through: :favorites, source: :user

	has_many :likes, dependent: :destroy
	has_many :liked_users, through: :likes, source: :user

	def is_favorited?(user)
		self.favorited_users.include?(user)
	end

	def is_liked?(user)
		self.liked_users.include?(user)
	end

	def count_favorites
		self.favorites_count = self.favorites.size
		self.save
	end

end
