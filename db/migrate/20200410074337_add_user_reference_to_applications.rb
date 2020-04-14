class AddUserReferenceToApplications < ActiveRecord::Migration[6.0]
  def change
    add_reference :applications, :user, null: false, foreign_key: true, default: 1
  end
end
