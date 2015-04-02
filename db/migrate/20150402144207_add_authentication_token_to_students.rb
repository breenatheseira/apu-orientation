class AddAuthenticationTokenToStudents < ActiveRecord::Migration
  def change
  	add_column :students, :authentication_token, :string
  	add_index :students, :authentication_token, unique: true

  end
end
