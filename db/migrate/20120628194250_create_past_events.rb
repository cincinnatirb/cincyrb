class CreatePastEvents < ActiveRecord::Migration
  def change
    create_table :past_events do |t|
      t.string   :topic
      t.datetime :date
      t.text     :description
      t.timestamps
    end
  end
end
