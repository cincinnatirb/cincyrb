require 'rails_helper'

RSpec.describe PagesController do
  it { is_expected.to route(:get, '/').to(action: :index) }
  it { is_expected.to route(:get, '/this_month_in_ruby').to(action: :this_month_in_ruby) }
end
