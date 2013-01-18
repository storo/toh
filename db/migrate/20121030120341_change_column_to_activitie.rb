class ChangeColumnToActivitie < ActiveRecord::Migration
  def up
	rename_column :activities, :type, :stage_id 
  end

  def down
  end
end
