class Speaker < ApplicationRecord
  has_and_belongs_to_many :past_events
end
