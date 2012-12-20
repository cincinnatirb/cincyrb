module ApplicationHelper

  def format_date_for_homepage(date)
    Time.at(date/1000).to_date.strftime("%b") +
      "<span>" + Time.at(date/1000).to_date.strftime("%e") + "</span>"
  end
end
