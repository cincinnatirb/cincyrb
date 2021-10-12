class Contact
  include ActiveModel::Validations
  include ActiveModel::Conversion
  extend ActiveModel::Naming

  attr_accessor :name, :email, :subject, :message

  validates :name, :subject, :message, presence: true
  validates :email, format: { with: /\A[-a-z0-9_+.]+@([-a-z0-9]+\.)+[a-z0-9]{2,4}\z/i }
  validates :subject, length: { maximum: 100 }
  validates :message, length: { maximum: 1000 }

  def initialize(attributes = {})
    attributes.each do |name, value|
      send("#{name}=", value)
    end
  end

  def persisted?
    false
  end
end
