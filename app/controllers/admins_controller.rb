class AdminsController < ApplicationController
	before_action :authenticate_admin!
	def index
		unless admin_signed_in?
			redirect_to new_admin_session_path
		end
	end
end
