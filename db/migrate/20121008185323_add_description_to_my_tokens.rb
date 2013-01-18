class AddDescriptionToMyTokens < ActiveRecord::Migration
  def change
	add_column :my_tokens, :description, :string
  end
end
