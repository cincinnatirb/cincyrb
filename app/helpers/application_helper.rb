require 'digest/md5'
module ApplicationHelper

  def format_date_for_homepage(date)
    Time.at(date/1000).to_date.strftime("%b") +
      "<span>" + Time.at(date/1000).to_date.strftime("%e") + "</span>"
  end

  def gravatar_url(email_address)
    hash = Digest::MD5.hexdigest(email_address.to_s)
    image_src = "http://www.gravatar.com/avatar/#{hash}?s=127"
  end
end
