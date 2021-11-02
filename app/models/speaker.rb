class Speaker < ApplicationRecord
  has_many :speaker_assignments, dependent: :destroy
  has_many :past_events, through: :speaker_assignments
end
