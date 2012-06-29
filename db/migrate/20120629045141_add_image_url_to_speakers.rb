class AddImageUrlToSpeakers < ActiveRecord::Migration
  def change
    change_table :speakers do |t| 
      t.string :image_url
    end
  end

  def down
    remove_column :speakers, :image_url
  end
end
