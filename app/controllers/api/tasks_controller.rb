class Api::TasksController < ApplicationController
	skip_before_filter :verify_authenticity_token,
	    :if => Proc.new { |c| c.request.format == 'application/json' }

  	respond_to :json

  	def index
  		# {"student"=>{"auth_token"=>"Go72Qx5oZvNi6H5Gi83g"}, "task"=>{"student"=>{"auth_token"=>"Go72Qx5oZvNi6H5Gi83g"}}}
  		information = request.raw_post 

    	authentication_token = JSON.parse(information)["student"]["auth_token"]
		student = Student.find_by(authentication_token: authentication_token)

		logger.info "information: #{information}"
		logger.info "authentication_token: #{authentication_token}"
		logger.info "student: #{student}"

		unless student.nil?
			student.intake_code = "hahaha"
			student.update_attributes(student_params)
			student.save
		end
  	end

  	def student_params
    	params.require(:student).permit(:intake_code)
	end
end
