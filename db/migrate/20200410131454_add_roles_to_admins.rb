class AddRolesToAdmins < ActiveRecord::Migration[6.0]
  def change
    add_column :admins, :director_role, :boolean, default: false
    add_column :admins, :supervisor_role, :boolean, default: false
    add_column :admins, :admin_role, :boolean, default: false
  end
end
