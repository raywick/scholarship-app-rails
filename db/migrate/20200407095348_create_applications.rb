class CreateApplications < ActiveRecord::Migration[6.0]
  def change
    create_table :applications do |t|
      t.integer :user_id
      t.integer :career_id
      t.integer :scholarship_id
      t.integer :period
      t.datetime :date_of_application

      t.timestamps
    end
  end
end
