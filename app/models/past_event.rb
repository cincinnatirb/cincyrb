class PastEvent < ActiveRecord::Base
  has_and_belongs_to_many :speakers
  has_many :videos

end
