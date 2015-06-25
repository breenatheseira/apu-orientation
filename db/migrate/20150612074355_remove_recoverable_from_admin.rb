class RemoveRecoverableFromAdmin < ActiveRecord::Migration
  def change
    remove_column :admins, :reset_password_token, :string
    remove_column :admins, :reset_password_sent_at, :string
  end
end
