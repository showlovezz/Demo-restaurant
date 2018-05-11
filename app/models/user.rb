class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  # 每位使用者擁有很多評論
  has_many :comments

  # 上傳照片 將 AvatarUploader 掛載到 User Model
  mount_uploader :avatar, AvatarUploader

  # 驗證名稱，必須必填
  validates_presence_of :name

  # 一個 User 評論過很多 Restaurant，一個 Restaurant 被很多個 User 評論
  has_many :restaurants, through: :comments

  def admin?
  	self.role == "admin"
  end

end
