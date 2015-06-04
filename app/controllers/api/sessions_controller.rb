class Api::SessionsController < Devise::SessionsController
# Tironi, 2012: http://lucatironi.github.io/tutorial/2012/10/15/ruby_rails_android_app_authentication_devise_tutorial_part_one/ 
 skip_before_filter :verify_authenticity_token,
                    :if => Proc.new { |c| c.request.format == 'application/json' }

  respond_to :json

  def create   
    visible_documents = Array.new

    visible_documents << Document.select(:document_url).where("document_type = ? AND intake_code = ?", "Orientation Schedule", true)
    visible_documents << Document.select(:document_url).where("document_type = ? AND intake_code = ?", "Student Handbook", true)
    visible_documents << Document.select(:document_url).where("document_type = ? AND intake_code = ?", "Course Schedule", true)
    visible_documents << Document.select(:document_url).where("document_type = ? AND intake_code = ?", "Fee Schedule", true)

    warden.authenticate!(:scope => resource_name, :recall => "#{controller_path}#failure")
    render :status => 200,
           :json => { 
              :success => true,
              :info => "Logged in",
              :data => {  
                :auth_token => current_student.authentication_token,
                :name => current_student.name,
                :intake_code => current_student.intake_code,
                :username => current_student.username,
                :documents => {
                  :orientation_schedule => visible_documents[0],
                  :handbook => visible_documents[1],
                  :important_details => visible_documents[2],
                  :fee_schedule => visible_documents[3]
                } 
              }
            }
    if (current_student.sign_in_count == 1)
      update_student_acknowledgement(current_student)      
    end
  end

  def destroy    
    warden.authenticate!(:scope => resource_name, :recall => "#{controller_path}#failure")
    current_student.update_column(:authentication_token, nil)
    render :status => 200,
           :json => { :success => true,
                      :info => "Logged out",
                      :data => {} }
  end

  def failure
    render :status => 401,
           :json => { :success => false,
                      :info => "Login Failed",
                      :data => {} }
  end


  private

  def update_student_acknowledgement(student)
    student.acknowledged_at = student.current_sign_in_at
    student.update_attributes(student_params)
  end

  def student_params
    params.require(:student).permit(:acknowledged_at)
  end

end
