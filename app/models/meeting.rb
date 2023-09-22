class Meeting
  include HTTParty

  base_uri 'https://api.meetup.com/'

  def self.next_meeting
    ruby_brigade_meetings.first
  end

  def self.upcoming_meetings
    ruby_brigade_meetings.slice(1, 3)
  end

  def self.ruby_brigade_meetings
    response = get('/TechLife-Cincinnati/events')
    return [] unless response.parsed_response.is_a?(Array)

    response.parsed_response.select { |event| event["name"][/Ruby Brigade/] }
  end
end
