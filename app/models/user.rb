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

  def admin?
  	self.role == "admin"
  end

end
