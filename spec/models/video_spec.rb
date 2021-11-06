require 'rails_helper'

RSpec.describe Video, type: :model do
  context 'Associations & Validations' do # rubocop:disable RSpec/ContextWording
    before { build(:video) }

    it { is_expected.to belong_to(:past_event) }
    it { is_expected.to validate_presence_of(:url) }
  end
end
