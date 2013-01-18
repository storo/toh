class AddOrdenToLanguages < ActiveRecord::Migration
  def change
	add_column :languages, :orden, :integer
  end
end
