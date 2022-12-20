require 'rails_helper'

RSpec.describe PastEventsController, type: :routing do
  it { is_expected.to route(:get, '/past_events').to(action: :index) }
  it { is_expected.to route(:get, '/past_events/2005/2').to(action: :show, year: '2005', month: '2') }
end
