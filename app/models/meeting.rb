class Meeting
  include HTTParty

  base_uri 'https://api.meetup.com/'

  def self.get_next_meeting
    self.ruby_brigade_meetings.first
  end

  def self.get_upcoming_meetings
    self.ruby_brigade_meetings.slice(1,3)
  end

  def self.ruby_brigade_meetings
    response = get('/TechLife-Cincinnati/events')
    if response.parsed_response.is_a?(Array)
      response.parsed_response.select { |event| event["name"] == "Ruby Brigade" }
    else
      []
    end
  end
end
