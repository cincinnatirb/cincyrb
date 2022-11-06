require 'rails_helper'

RSpec.describe ApplicationController, type: :request do
  describe 'logging in' do
    let(:admin_user) { create(:admin_user, password:) }
    let(:email) { admin_user.email }
    let(:password) { 'i-should-be-difficult-to-guess' }

    context 'when successful' do
      subject { post admin_user_session_path(admin_user: { email:, password: }) }

      it { is_expected.to redirect_to(admin_past_events_path) }
    end

    context 'when unsuccessful' do
      subject { post admin_user_session_path(admin_user: { email:, password: "#{password}-and-then-some" }) }

      it { is_expected.to render_template(:new) }
    end
  end
end
