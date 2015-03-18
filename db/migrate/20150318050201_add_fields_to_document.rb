class AddFieldsToDocument < ActiveRecord::Migration
  def change
  	add_column :documents, :name, :string
  	add_column :documents, :type, :string
  	add_column :documents, :document_url, :text
  	add_column :documents, :visible_status, :boolean
  end
end
