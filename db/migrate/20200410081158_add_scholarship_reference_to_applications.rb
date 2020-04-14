class AddScholarshipReferenceToApplications < ActiveRecord::Migration[6.0]
  def change
    add_reference :applications, :scholarship, null: false, foreign_key: true, default: 1
  end
end
