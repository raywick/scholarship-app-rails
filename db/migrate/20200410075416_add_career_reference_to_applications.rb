class AddCareerReferenceToApplications < ActiveRecord::Migration[6.0]
  def change
    add_reference :applications, :career, null: false, foreign_key: true, default: 1
  end
end
