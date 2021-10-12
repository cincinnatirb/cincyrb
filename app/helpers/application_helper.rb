require 'digest/md5'
module ApplicationHelper
  def date_from_meetup(timestamp)
    Time.zone.at(timestamp / 1000).to_date
  end

  def format_date_for_homepage(date)
    "#{date_from_meetup(date).strftime('%b')}<span>#{date_from_meetup(date).strftime('%e')}</span>"
  end

  def gravatar_url(email_address)
    hash = Digest::MD5.hexdigest(email_address.to_s)
    "http://www.gravatar.com/avatar/#{hash}?s=127"
  end
end
