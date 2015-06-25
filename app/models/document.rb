class Document < ActiveRecord::Base
	mount_uploader :document_url, FileUploader

	validates :name, :document_url, :intake_code, presence: true
end
