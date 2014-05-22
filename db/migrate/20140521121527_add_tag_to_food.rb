class AddTagToFood < ActiveRecord::Migration
  def change
  	add_column :foods, :tag, :string
  	
  end
end
