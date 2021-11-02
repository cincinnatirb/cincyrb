class AddIdAndIndexesToSpeakerAssignments < ActiveRecord::Migration[6.0]
  def change
    add_column :speaker_assignments, :id, :primary_key
    add_index :speaker_assignments, [:past_event_id, :speaker_id]
  end
end
