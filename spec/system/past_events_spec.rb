require "rails_helper"

RSpec.describe "Past Events", type: :system do
  context 'when creating' do
    let(:password) { 'P4ssw0rd' }
    let!(:admin_user) { create(:admin_user, email: 'jim@example.com', password: password) }
    let!(:speaker) { create(:speaker, name: 'Jim Weirich') }

    before do
      visit admin_user_session_path
      fill_in :admin_user_email, with: admin_user.email
      fill_in :admin_user_password, with: password
      click_on 'Login'
      visit new_admin_past_event_path
      expect(page).to have_text('New Past Event')
    end

    scenario do
      fill_in :past_event_date, with: Time.zone.parse("#{1.day.from_now.strftime('%Y-%m-%d')}, 12:00:00 PM")
      fill_in :past_event_topic, with: 'A Really Cool Rails Feature'
      select speaker.name, from: :past_event_speaker_ids
      fill_in :past_event_description, with: 'No, we mean it! This is a reeeeally cool Rails feature.'

      click_on 'Create Past event'

      new_past_event = PastEvent.last
      expect(new_past_event.topic).to eq('A Really Cool Rails Feature')
      expect(speaker.reload.past_events).to include(new_past_event)
    end
  end

  context 'when listing' do
    subject { page }

    let!(:speaker) { create(:speaker, name: 'Jim Weirich') }
    let!(:past_event) { create(:past_event, topic: 'A Really Cool Rails Feature', speakers: [speaker]) }
    let!(:video) { create(:video, url: 'https://example.com/video/qwerty', past_event: past_event) }

    before do
      VCR.use_cassette('spec_system_past-events-spec', record: :new_episodes) do
        visit past_events_path
      end
    end

    it { is_expected.to have_text(past_event.topic) }
    it { is_expected.to have_selector('div.speakers') }
    it { is_expected.to have_text(speaker.name) }
    it { is_expected.to have_selector('div.videos') }
    it { is_expected.to have_selector("iframe[src='#{video.url}']") }
  end
end
