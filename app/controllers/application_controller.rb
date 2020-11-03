class ApplicationController < ActionController::Base
	before_action :configure_permitted_parameters, if: :devise_controller?






	protected

	def configure_permitted_parameters
		devise_parameter_sanitizer.permit(:sign_up, keys: [:name_first, :name_family, :name_first_kana, :name_family_kana, :postal_code, :address, :tel])

	end
end
