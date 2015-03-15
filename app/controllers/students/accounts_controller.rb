class Students::AccountsController < ApplicationController
	def index
		@students = Student.all
	end
end
