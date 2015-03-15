class AddAttributesToStudent < ActiveRecord::Migration
  def change
  	add_column :students, :name, :string 
  	add_column :students, :intake_code, :string
  	add_column :students, :acknowledged_at, :datetime
  end
end
