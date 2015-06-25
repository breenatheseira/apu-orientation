class AddIntakeCodeToDocuments < ActiveRecord::Migration
  def change
    add_column :documents, :intake_code, :string
  end
end
