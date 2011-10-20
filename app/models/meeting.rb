class Meeting
  include HTTParty

  base_uri 'https://api.meetup.com/2'

  def self.get_meeting(event_id)
    get("/event/#{event_id}?key=#{MEETUP_API_KEY}")
  end
end
