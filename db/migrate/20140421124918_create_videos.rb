class CreateVideos < ActiveRecord::Migration
  def change
    create_table :videos do |t|
      t.string :title
      t.string :flash
      t.string :cover

      t.timestamps
    end
  end
end
