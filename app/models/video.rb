class Video < ApplicationRecord
  belongs_to :past_event

  validates :url, presence: true
end
