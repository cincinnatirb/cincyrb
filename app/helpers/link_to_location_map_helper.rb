module LinkToLocationMapHelper
  LAUNCHSCOUT_MAP_URL = 'https://goo.gl/maps/iw1QZHmUk5RfvfBZ6'.freeze

  def link_to_location_map(text, options = {})
    link_to text, LAUNCHSCOUT_MAP_URL, options
  end
end
