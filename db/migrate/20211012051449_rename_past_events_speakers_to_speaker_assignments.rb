class RenamePastEventsSpeakersToSpeakerAssignments < ActiveRecord::Migration[6.0]
  def change
    rename_table :past_events_speakers, :speaker_assignments
  end
end
