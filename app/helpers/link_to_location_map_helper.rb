module LinkToLocationMapHelper
  GASLIGHT_MAP_URL = 'https://goo.gl/maps/iw1QZHmUk5RfvfBZ6'

  def link_to_location_map(text, options = {})
    link_to text, GASLIGHT_MAP_URL, options
  end
end
