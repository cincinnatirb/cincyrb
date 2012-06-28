class PastEvent < ActiveRecord::Base
  #has_many :speakers, :through => :past_events_speakers
  has_and_belongs_to_many :speakers

end
