class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  # 每位使用者擁有很多評論
  has_many :comments

  def admin?
  	self.role == "admin"
  end

end
