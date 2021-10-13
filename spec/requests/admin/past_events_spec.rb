require 'rails_helper'

RSpec.describe '/admin/past_events', type: :request do
  let(:password) { 'P4ssw0rd!' }
  let!(:admin_user) { create(:admin_user, password: password) }
  let(:valid_attributes) {
    { date: Time.zone.today + 4.weeks, topic: 'Rails Today' }
  }
  let(:invalid_attributes) {
    { date: Time.zone.today + 4.weeks, topic: nil }
  }

  describe 'GET /index' do
    context 'when NOT logged in' do
      it 'redirects to the root path' do
        get admin_past_events_url
        expect(response).to redirect_to(root_path)
      end
    end

    context 'when logged in' do
      before do
        create(:past_event, valid_attributes)
        sign_in_as(admin_user.email, password)
      end

      it 'renders a successful response' do
        get admin_past_events_url
        expect(response).to be_successful
      end
    end
  end

  describe 'GET /show' do
    let(:past_event) { create(:past_event, valid_attributes) }

    it 'renders a successful response' do
      get admin_past_event_url(past_event)
      expect(response).to be_successful
    end
  end

  describe 'GET /new' do
    it 'renders a successful response' do
      get new_admin_past_event_url
      expect(response).to be_successful
    end
  end

  describe 'GET /edit' do
    it 'render a successful response' do
      past_event = Admin::PastEvent.create! valid_attributes
      get edit_admin_past_event_url(admin_past_event)
      expect(response).to be_successful
    end
  end

  describe 'POST /create' do
    context 'with valid parameters' do
      it 'creates a new Admin::PastEvent' do
        expect {
          post admin_past_events_url, params: { admin_past_event: valid_attributes }
        }.to change(Admin::PastEvent, :count).by(1)
      end

      it 'redirects to the created admin_past_event' do
        post admin_past_events_url, params: { admin_past_event: valid_attributes }
        expect(response).to redirect_to(admin_past_event_url(@admin_past_event))
      end
    end

    context 'with invalid parameters' do
      it 'does not create a new Admin::PastEvent' do
        expect {
          post admin_past_events_url, params: { admin_past_event: invalid_attributes }
        }.to change(Admin::PastEvent, :count).by(0)
      end

      it "renders a successful response (i.e. to display the 'new' template)" do
        post admin_past_events_url, params: { admin_past_event: invalid_attributes }
        expect(response).to be_successful
      end
    end
  end

  describe 'PATCH /update' do
    context 'with valid parameters' do
      let(:new_attributes) {
        skip('Add a hash of attributes valid for your model')
      }

      it 'updates the requested admin_past_event' do
        past_event = Admin::PastEvent.create! valid_attributes
        patch admin_past_event_url(admin_past_event), params: { admin_past_event: new_attributes }
        past_event.reload
        skip('Add assertions for updated state')
      end

      it 'redirects to the admin_past_event' do
        past_event = Admin::PastEvent.create! valid_attributes
        patch admin_past_event_url(admin_past_event), params: { admin_past_event: new_attributes }
        past_event.reload
        expect(response).to redirect_to(admin_past_event_url(past_event))
      end
    end

    context 'with invalid parameters' do
      it "renders a successful response (i.e. to display the 'edit' template)" do
        past_event = Admin::PastEvent.create! valid_attributes
        patch admin_past_event_url(admin_past_event), params: { admin_past_event: invalid_attributes }
        expect(response).to be_successful
      end
    end
  end

  describe 'DELETE /destroy' do
    it 'destroys the requested admin_past_event' do
      past_event = Admin::PastEvent.create! valid_attributes
      expect {
        delete admin_past_event_url(admin_past_event)
      }.to change(Admin::PastEvent, :count).by(-1)
    end

    it 'redirects to the admin_past_events list' do
      past_event = Admin::PastEvent.create! valid_attributes
      delete admin_past_event_url(admin_past_event)
      expect(response).to redirect_to(admin_past_events_url)
    end
  end
end
