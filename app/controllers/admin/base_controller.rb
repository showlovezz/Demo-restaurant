class Admin::BaseController < ApplicationController

	# 驗證該 User 身份是否為網站管理員
	before_action :authenticate_admin

	private

	def authenticate_admin
		unless current_user.admin?
			flash[:alert] = "Not allow"
			redirect_to root_path
		end
	end
	
end