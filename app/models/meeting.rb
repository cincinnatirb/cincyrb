class Meeting
  include HTTParty

  base_uri 'https://api.meetup.com/2'

  def self.get_next_meeting
    meetings = get("/events?group_id=1460552&fields=name&key=#{ENV.fetch('MEETUP_API_KEY')}")
    meetings["results"].select { |m| m["name"] == "Ruby Brigade" }.first
  end
end
