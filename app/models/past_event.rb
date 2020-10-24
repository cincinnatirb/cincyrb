class PastEvent < ApplicationRecord
  has_and_belongs_to_many :speakers
  has_many :videos

  def self.recent
    order('date DESC')
  end
end
