class ApplicationController < ActionController::Base
	
	protect_from_forgery with: :exception
  	
  	# 驗證請求進入後台的是否為已登入的 User
	before_action :authenticate_user!

	# Devise 客製化屬性的使用說明：  https://github.com/plataformatec/devise#strong-parameters
	before_action :configure_permitted_parameters, if: :devise_controller?

	protected

	def configure_permitted_parameters
		devise_parameter_sanitizer.permit(:sign_up, keys: [:name])
		devise_parameter_sanitizer.permit(:account_update, keys: [:name])
	end

end
