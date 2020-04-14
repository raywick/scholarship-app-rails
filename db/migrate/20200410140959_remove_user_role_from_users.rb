class RemoveUserRoleFromUsers < ActiveRecord::Migration[6.0]
  def up
    remove_column :users, :user_role
  end

  def down
    add_column :users, :user_role, :boolean
  end
end
