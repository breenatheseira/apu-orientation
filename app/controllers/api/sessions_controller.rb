class Api::SessionsController < Devise::SessionsController
# Tironi, 2012: http://lucatironi.github.io/tutorial/2012/10/15/ruby_rails_android_app_authentication_devise_tutorial_part_one/ 
 skip_before_filter :verify_authenticity_token,
                    :if => Proc.new { |c| c.request.format == 'application/json' }

  respond_to :json

  def create
    visible_documents = Array.new   

    visible_documents << Document.select(:document_url).where("document_type = ? AND visible_status = ?", "Orientation Schedule", true)
    visible_documents << Document.select(:document_url).where("document_type = ? AND visible_status = ?", "Student Handbook", true)
    visible_documents << Document.select(:document_url).where("document_type = ? AND visible_status = ?", "Course Schedule", true)
    visible_documents << Document.select(:document_url).where("document_type = ? AND visible_status = ?", "Fee Schedule", true)

    warden.authenticate!(:scope => resource_name, :recall => "#{controller_path}#failure")

    intake = getIntakeCode(current_student.intake_code) # UCD1F1503EE

    logger.info "intake: #{intake}"

    visible_documents = Array.new

    visible_documents << select_document("Orientation Schedule", intake)
    visible_documents << select_document("Student Handbook", intake)
    visible_documents << select_document("Important Details", intake)
    visible_documents << select_document("Fee Schedule", intake)

    logger.info "visible_documents's length: #{visible_documents.count}"
    logger.info "is visible_documents empty?: #{visible_documents.empty?}"
    logger.info "first element: visible_documents: #{visible_documents.first.blank?}"

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
    if (current_student.sign_in_count == 1 && documents_exists(visible_documents))
      update_student_acknowledgement(current_student)
    else
      current_student.update_attributes(sign_in_count: 0)
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

  def getIntakeCode(student_intake_code)
    if student_intake_code[2] == 'F'
      student_intake_code[0..7]
    elsif student_intake_code[2] == 'D'
      student_intake_code[0..8]
      end
  end

  def select_document(type, intake)
    Document.select(:document_url).where("document_type = ? AND intake_code = ?", type, intake)
  end

  def documents_exists(array)
    for i in 0..3
      if (array[i].blank?)
        return false
      end
    end
  end

  def update_student_acknowledgement(student)
    student.acknowledged_at = student.current_sign_in_at
    student.update_attributes(student_params)
  end

  def student_params
    params.require(:student).permit(:acknowledged_at, :sign_in_count)
  end

end
