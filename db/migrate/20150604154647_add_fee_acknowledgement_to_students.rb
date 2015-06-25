class AddFeeAcknowledgementToStudents < ActiveRecord::Migration
  def change
    add_column :students, :fee_acknowledgement, :datetime
  end
end
