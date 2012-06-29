class AddSpeakersToEvents < ActiveRecord::Migration
  def change
    create_table :past_events_speakers, :id => false do |t|
      t.integer :speaker_id 
      t.integer :past_event_id
    end
  end
end
