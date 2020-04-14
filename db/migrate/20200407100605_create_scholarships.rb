class CreateScholarships < ActiveRecord::Migration[6.0]
  def change
    create_table :scholarships do |t|
      t.string :status
      t.string :details

      t.timestamps
    end
  end
end
