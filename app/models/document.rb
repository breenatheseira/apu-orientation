class Document < ActiveRecord::Base
	mount_uploader :document_url, FileUploader
end
