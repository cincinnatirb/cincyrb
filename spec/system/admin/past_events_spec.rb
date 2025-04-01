require "rails_helper"

RSpec.describe "PastEvent Administration" do
  let!(:admin_user) { create(:admin_user, email: 'jim@example.com', password: 'P4ssw0rd') }
  let!(:other_speaker) { create(:speaker, name: 'Chris Nelson') }

  context 'when creating' do
    let!(:speaker) { create(:speaker, name: 'Jim Weirich') }

    before do
      visit admin_user_session_path

      fill_in :admin_user_email, with: admin_user.email
      fill_in :admin_user_password, with: 'P4ssw0rd'
      click_button 'Log in'

      visit new_admin_past_event_path
      expect(page).to have_text('New Past Event')
    end

    scenario 'can select multiple Speakers', skip: "Passes locally but not in CI" do
      expect(page).to have_field('past_event_date', disabled: false)
      fill_in 'past_event_date', with: 1.day.from_now.strftime('%Y-%m-%d') # Date fields expect YYYY-MM-DD format
      fill_in 'past_event[topic]', with: 'A Really Cool Rails Feature'
      select speaker.name, from: 'past_event[speaker_ids][]'
      select other_speaker.name, from: 'past_event[speaker_ids][]'
      fill_in 'past_event[description]', with: 'No, we mean it! This is a reeeeally cool Rails feature.'

      click_button 'commit'

      new_past_event = PastEvent.last
      expect(new_past_event.topic).to eq('A Really Cool Rails Feature')
      expect(new_past_event.speakers).to include(other_speaker, speaker)
    end
  end

  context 'when updating' do
    let!(:past_event) { create(:past_event, :with_speakers, speaker_count: 2) }

    before do
      visit admin_user_session_path

      fill_in :admin_user_email, with: admin_user.email
      fill_in :admin_user_password, with: 'P4ssw0rd'
      click_button 'Log in'

      expect(page).to have_link('Logout')

      visit edit_admin_past_event_path(past_event)
      expect(page).to have_text('Editing Past Event')
    end

    scenario 'removes specific Speaker(s) and adds new Speaker(s)' do
      unselect past_event.speakers.first.name, from: 'past_event[speaker_ids][]'
      select other_speaker.name, from: 'past_event[speaker_ids][]'

      click_button 'commit'

      expect(past_event.reload.speakers.map(&:name).sort).to eq([other_speaker.name, past_event.speakers.last.name].sort)
    end
  end

  context 'when listing' do
    subject { page }

    let!(:past_events) { create_list(:past_event, 4, :all_fields, :with_speakers, speaker_count: 2) }

    before do
      visit admin_user_session_path

      fill_in :admin_user_email, with: admin_user.email
      fill_in :admin_user_password, with: 'P4ssw0rd'
      click_button 'Log in'

      visit admin_past_events_path
      expect(page).to have_text('Past Events')
    end

    it { is_expected.to have_text(past_events[0].topic) }
    it { is_expected.to have_text(past_events[1].date.to_date) }
    it { is_expected.to have_text(past_events[2].speaker_names) }
    it { is_expected.to have_text(past_events[3].description) }

    it 'lists all Past Events' do
      expect(page.all('[data-test^="past-event-id"]').count).to eq(past_events.count)
    end
  end
end
