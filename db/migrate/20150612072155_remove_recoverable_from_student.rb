class RemoveRecoverableFromStudent < ActiveRecord::Migration
  def change
    remove_column :students, :reset_password_token, :string
    remove_column :students, :reset_password_sent_at, :string
  end
end
