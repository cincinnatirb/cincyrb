require 'rails_helper'

RSpec.describe Speaker do
  context 'Associations & Validations' do # rubocop:disable RSpec/ContextWording
    before { build(:speaker) }

    it { is_expected.to have_many(:speaker_assignments).dependent(:destroy) }
    it { is_expected.to have_many(:past_events).through(:speaker_assignments) }
    it { is_expected.to validate_presence_of(:name) }
  end
end
