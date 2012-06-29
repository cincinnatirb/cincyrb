class CreateVideos < ActiveRecord::Migration
  def change
    create_table :videos do |t|
      t.string :url
      t.integer :past_event_id
      t.timestamps
    end
  end
end
