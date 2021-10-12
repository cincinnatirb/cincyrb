class PastEvent < ApplicationRecord
  has_many :speaker_assignments, dependent: :destroy
  has_many :speakers, through: :speaker_assignments
  has_many :videos, dependent: :destroy

  def self.recent
    order('date DESC')
  end
end
