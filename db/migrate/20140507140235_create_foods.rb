class CreateFoods < ActiveRecord::Migration
  def change
    create_table :foods do |t|
      t.string :name
      t.text :description
      t.string :cover
      t.text :cook
      t.string :area

      t.timestamps
    end
  end
end
