class ModUserToInvitation < ActiveRecord::Migration
  def up
	change_column :invitations, :user_id, :string 
 end

  def down
  end
end
