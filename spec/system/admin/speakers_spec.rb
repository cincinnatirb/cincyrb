require "rails_helper"

RSpec.describe "Speaker Administration" do
  let!(:admin_user) { create(:admin_user, email: 'jim@example.com', password: 'P4ssw0rd') }

  context 'when creating' do
    before do
      visit admin_user_session_path

      fill_in :admin_user_email, with: admin_user.email
      fill_in :admin_user_password, with: 'P4ssw0rd'

      click_button 'Log in'

      visit new_admin_speaker_path
      expect(page).to have_text('New Speaker')
    end

    scenario 'succeeds' do
      fill_in 'speaker[name]', with: 'Jim Weirich'
      fill_in 'speaker[bio]', with: 'I\'ve done it all.'
      fill_in 'speaker[email]', with: 'jim.weirich@example.com'
      fill_in 'speaker[image_url]', with: 'https://example.com/jimweirich/images/avatar.png'

      click_button 'commit'

      new_speaker = Speaker.last
      expect(new_speaker.name).to eq('Jim Weirich')
      expect(new_speaker.bio).to eq('I\'ve done it all.')
      expect(new_speaker.email).to eq('jim.weirich@example.com')
      expect(new_speaker.image_url).to eq('https://example.com/jimweirich/images/avatar.png')
    end
  end

  context 'when updating' do
    let!(:speaker) { create(:speaker, :all_fields) }

    before do
      visit admin_user_session_path

      fill_in :admin_user_email, with: admin_user.email
      fill_in :admin_user_password, with: 'P4ssw0rd'
      click_button 'Log in'

      visit edit_admin_speaker_path(speaker)
      expect(page).to have_text('Editing Speaker')
    end

    scenario 'succeeds' do
      fill_in 'speaker[name]', with: "#{speaker.name} Ph.D."
      fill_in 'speaker[bio]', with: "#{speaker.bio} and more!"
      fill_in 'speaker[email]', with: "new.#{speaker.email}"
      fill_in 'speaker[image_url]', with: Faker::Internet.url(host: 'example.com', path: '/avatar/new.jpeg')

      click_button 'commit'

      old_data = speaker.attributes
      speaker.reload
      expect(speaker.name).to eq("#{old_data['name']} Ph.D.")
      expect(speaker.bio).to eq("#{old_data['bio']} and more!")
      expect(speaker.email).to eq("new.#{old_data['email']}")
      expect(speaker.image_url).to eq(Faker::Internet.url(host: 'example.com', path: '/avatar/new.jpeg'))
    end
  end

  context 'when listing' do
    subject { page }

    let!(:speakers) { create_list(:speaker, 5, :all_fields) }

    before do
      visit admin_user_session_path

      fill_in :admin_user_email, with: admin_user.email
      fill_in :admin_user_password, with: 'P4ssw0rd'
      click_button 'Log in'

      visit admin_speakers_path
      expect(page).to have_text('Speakers')
    end

    it { is_expected.to have_text(speakers[0].name) }
    it { is_expected.to have_text(speakers[1].bio) }
    it { is_expected.to have_text(speakers[2].email) }
    it { is_expected.to have_text(speakers[3].image_url) }

    it 'lists all Speakers' do
      expect(page.all('[data-test^="speaker-id"]').count).to eq(speakers.count)
    end
  end
end
