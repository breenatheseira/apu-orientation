class Students::AccountsController < ApplicationController
	before_action :authenticate_admin!
	def index
		@students = Student.all.order(fee_acknowledgement: :asc, acknowledged_at: :asc).page(params[:page]).per(25)
	end

	def acknowledge_student
		@student = Student.find(params[:id])
		
		if @student.update_attributes(acknowledged_at: Time.now)
			flash[:notice] = "Student ID: #{@student.id} (Student #{@student.name}) has been acknowledged to receive the application."
		else
			flash[:danger] = "Failed to acknowledge student."
		end		
		redirect_to students_accounts_path
	end

	def acknowledge_fee
		@student = Student.find(params[:id])
		
		if @student.update_attributes(fee_acknowledgement: Time.now)
			flash[:notice] = "Student ID: #{@student.id} (Student #{@student.name}) has acknowledged the Fee Schedule."
		else
			flash[:danger] = "Failed to update student's fee acknowledgement status."
		end		
		redirect_to students_accounts_path
	end

	private

	def student_params
		params.require(:student).permit(:name, :email, :password, :password_confirmation, :remember_me)
	end
end
