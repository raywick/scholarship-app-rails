class RemoveCareerIdFieldFromApplications < ActiveRecord::Migration[6.0]
  def up
    remove_column :applications, :career_id
  end
  def down
    add_column :applications, :career_id, :integer
  end
end
