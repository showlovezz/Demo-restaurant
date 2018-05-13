class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  # 上傳照片 將 AvatarUploader 掛載到 User Model
  mount_uploader :avatar, AvatarUploader

  # 驗證名稱，必須必填
  validates_presence_of :name

  # 如果 User 已經有了評論，就不允許刪除帳號（刪除時拋出 Error）
  has_many :comments, dependent: :restrict_with_error

  # 一個 User 評論過很多 Restaurant，一個 Restaurant 被很多個 User 評論
  has_many :commented_restaurants, through: :comments, source: :restaurant

  # 「使用者收藏很多餐廳」的多對多關聯
  has_many :favorites, dependent: :destroy
  has_many :favorited_restaurants, through: :favorites, source: :restaurant

  # 「使用者喜歡很多餐廳」的多對多關聯
  has_many :likes, dependent: :destroy
  has_many :liked_restaurants, through: :likes, source: :restaurant

  def admin?
  	self.role == "admin"
  end

end
