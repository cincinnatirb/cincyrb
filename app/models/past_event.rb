class PastEvent < ApplicationRecord
  has_many :speaker_assignments, dependent: :destroy
  has_many :speakers, through: :speaker_assignments
  has_many :videos, dependent: :destroy

  validates :date, presence: true
  validates :topic, presence: true

  def self.recent
    order('date DESC')
  end

  def speaker_names
    speakers.map(&:name).join(', ')
  end

  def topic_with_date
    "#{date.strftime('%B %Y')}: #{topic}"
  end
end
