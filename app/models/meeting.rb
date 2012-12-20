class Meeting
  include HTTParty

  base_uri 'https://api.meetup.com/2'

  def self.get_next_meeting
    self.ruby_brigade_meetings.first
  end

  def self.get_upcoming_meetings
    self.ruby_brigade_meetings.slice(1,3)
  end

  def self.ruby_brigade_meetings
    all_events = get("/events?group_id=1460552&fields=name&key=#{ENV.fetch('MEETUP_API_KEY')}")
    all_events["results"].select { |m| m["name"] == "Ruby Brigade" }
  end
end
