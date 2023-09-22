require "rails_helper"
require 'securerandom'

RSpec.describe "Video Administration" do
  let!(:admin_user) { create(:admin_user, email: 'jim@example.com', password: 'P4ssw0rd') }
  let!(:past_event) { create(:past_event) }
  let(:url) { Faker::Internet.url(host: 'example.com', path: "/videos/#{SecureRandom.alphanumeric(8)}") }

  context 'when creating' do
    before do
      visit admin_user_session_path

      fill_in :admin_user_email, with: admin_user.email
      fill_in :admin_user_password, with: 'P4ssw0rd'
      click_button 'Log in'

      visit new_admin_video_path
      expect(page).to have_text('New Video')
    end

    scenario 'succeeds' do
      fill_in 'video[url]', with: url
      select past_event.topic, from: 'video[past_event_id]'

      click_button 'commit'

      new_video = Video.last
      expect(new_video.url).to eq(url)
      expect(new_video.past_event).to eq(past_event)
    end
  end

  context 'when updating' do
    let!(:video) { create(:video) }
    let!(:other_event) { create(:past_event) }

    before do
      visit admin_user_session_path

      fill_in :admin_user_email, with: admin_user.email
      fill_in :admin_user_password, with: 'P4ssw0rd'
      click_button 'Log in'

      visit edit_admin_video_path(video)
      expect(page).to have_text('Editing Video')
    end

    scenario 'succeeds' do
      fill_in 'video[url]', with: "#{video.url}v2"
      select other_event.topic, from: 'video[past_event_id]'

      click_button 'commit'

      old_data = video.attributes
      video.reload
      expect(video.url).to eq("#{old_data['url']}v2")
      expect(video.past_event).to eq(other_event)
    end
  end

  context 'when listing' do
    subject { page }

    let!(:videos) { create_list(:video, 3) }

    before do
      visit admin_user_session_path

      fill_in :admin_user_email, with: admin_user.email
      fill_in :admin_user_password, with: 'P4ssw0rd'
      click_button 'Log in'

      visit admin_videos_path
      expect(page).to have_text('Videos')
    end

    it { is_expected.to have_text(videos[0].url) }
    it { is_expected.to have_text(videos[1].past_event.topic) }

    it 'lists all Videos' do
      expect(page.all('[data-test^="video-id"]').count).to eq(videos.count)
    end
  end
end
