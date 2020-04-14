class RemoveScholarshipIdFieldFromApplications < ActiveRecord::Migration[6.0]
  def up
    remove_column :applications, :scholarship_id
  end
  def down
    add_column :applications, :scholarship_id, :integer
  end
end
