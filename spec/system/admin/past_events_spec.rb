require "rails_helper"

RSpec.describe "PastEvent Administration", type: :system do
  let!(:admin_user) { create(:admin_user, email: 'jim@example.com', password: 'P4ssw0rd') }
  let!(:other_speaker) { create(:speaker, name: 'Chris Nelson') }

  context 'when creating' do
    let!(:speaker) { create(:speaker, name: 'Jim Weirich') }

    before do
      visit admin_user_session_path
      fill_in :admin_user_email, with: admin_user.email
      fill_in :admin_user_password, with: 'P4ssw0rd'
      click_on 'Login'
      visit new_admin_past_event_path
      expect(page).to have_text('New Past Event')
    end

    scenario 'can select multiple Speakers' do
      fill_in 'past_event[date]', with: Time.zone.parse("#{1.day.from_now.strftime('%Y-%m-%d')}, 12:00:00 PM")
      fill_in 'past_event[topic]', with: 'A Really Cool Rails Feature'
      select speaker.name, from: 'past_event[speaker_ids][]'
      select other_speaker.name, from: 'past_event[speaker_ids][]'
      fill_in 'past_event[description]', with: 'No, we mean it! This is a reeeeally cool Rails feature.'

      click_on 'commit'

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
      click_on 'Login'
      visit edit_admin_past_event_path(past_event)
      expect(page).to have_text('Editing Past Event')
    end

    scenario 'removes specific Speaker(s) and adds new Speaker(s)' do
      unselect past_event.speakers.first.name, from: 'past_event[speaker_ids][]'
      select other_speaker.name, from: 'past_event[speaker_ids][]'

      click_on 'commit'

      expect(past_event.reload.speakers.map(&:name)).to eq([other_speaker.name, past_event.speakers.last.name])
    end
  end
end
