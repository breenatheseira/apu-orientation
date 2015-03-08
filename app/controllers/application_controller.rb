class ApplicationController < ActionController::Base
	# Prevent CSRF attacks by raising an exception.
	# For APIs, you may want to use :null_session instead.
	protect_from_forgery with: :exception


	# Preventing an infinite loop after admins signed in (RSB, 2013)
	# http://stackoverflow.com/questions/19855866/how-to-set-devise-sign-in-page-as-root-page-in-rails
	def after_sign_in_path_for(resource_or_scope)
		admins_menu_path
	end

	# def after_sign_out_path_for(resource_or_scope)
	# 	your_path
	# end
end
