require 'rails_helper'

RSpec.describe 'Authentication' do
  subject { page }

  let(:password) { 'P4ssw0rd' }
  let!(:admin_user) { create(:admin_user, email: 'jim@example.com', password:) }

  describe 'success' do
    before do
      visit admin_user_session_path

      fill_in :admin_user_email, with: admin_user.email
      fill_in :admin_user_password, with: password
      click_button 'Log in'
    end

    it { is_expected.to have_text('Signed in successfully.') }
  end

  describe 'failure' do
    before do
      visit admin_user_session_path

      fill_in :admin_user_email, with: admin_user.email
      fill_in :admin_user_password, with: "#{password}-fat-fingers!"
      click_button 'Log in'
    end

    it { is_expected.to have_text('Invalid email or password.') }
  end
end
