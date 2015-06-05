class RemoveVisibleStatusFromDocuments < ActiveRecord::Migration
  def change
    remove_column :documents, :visible_status, :boolean
  end
end
