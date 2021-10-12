class SpeakerAssignment < ApplicationRecord
  belongs_to :past_event
  belongs_to :speaker
end
