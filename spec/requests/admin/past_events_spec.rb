require 'rails_helper'

RSpec.describe '/admin/past_events' do
  let!(:admin_user) { create(:admin_user, password: 'P4ssw0rd!') }
  let!(:speaker) { create(:speaker) }
  let(:valid_attributes) {
    { date: Time.zone.today + 4.weeks, speaker_ids: [speaker.id.to_s, ""], topic: 'Rails Today' }
  }
  let(:invalid_attributes) {
    { date: Time.zone.today + 4.weeks, speaker_ids: [speaker.id.to_s, ""], topic: nil }
  }
  let!(:past_event) { create(:past_event) }

  describe 'GET /index' do
    context 'when NOT logged in' do
      it 'redirects to the root path' do
        get admin_past_events_url
        expect(response).to redirect_to(root_path)
      end
    end

    context 'when logged in' do
      before { sign_in_as(admin_user) }

      it 'renders a successful response' do
        get admin_past_events_url
        expect(response).to be_successful
      end
    end
  end

  describe 'GET /show' do
    context 'when NOT logged in' do
      it 'redirects to the root path' do
        get admin_past_event_url(past_event)
        expect(response).to redirect_to(root_path)
      end
    end

    context 'when logged in' do
      before { sign_in_as(admin_user) }

      it 'renders a successful response' do
        get admin_past_event_url(past_event)
        expect(response).to be_successful
      end
    end
  end

  describe 'GET /new' do
    context 'when NOT logged in' do
      it 'redirects to the root path' do
        get new_admin_past_event_url
        expect(response).to redirect_to(root_path)
      end
    end

    context 'when logged in' do
      before { sign_in_as(admin_user) }

      it 'renders a successful response' do
        get new_admin_past_event_url
        expect(response).to be_successful
      end
    end
  end

  describe 'GET /edit' do
    context 'when NOT logged in' do
      it 'redirects to the root path' do
        get edit_admin_past_event_url(past_event)
        expect(response).to redirect_to(root_path)
      end
    end

    context 'when logged in' do
      before { sign_in_as(admin_user) }

      it 'render a successful response' do
        get edit_admin_past_event_url(past_event)
        expect(response).to be_successful
      end
    end
  end

  describe 'POST /create' do
    context 'when NOT logged in' do
      it 'redirects to the root path' do
        post admin_past_events_url, params: { past_event: valid_attributes }
        expect(response).to redirect_to(root_path)
      end
    end

    context 'when logged in' do
      before { sign_in_as(admin_user) }

      context 'with valid parameters' do
        it 'creates a new PastEvent' do
          expect {
            post admin_past_events_url, params: { past_event: valid_attributes }
          }.to change(PastEvent, :count).by(1)
        end

        it 'redirects to the created PastEvent' do
          post admin_past_events_url, params: { past_event: valid_attributes }
          expect(response).to redirect_to(admin_past_event_url(PastEvent.last))
        end

        it 'creates exactly one speaker assignment per selected speaker' do
          create_params = {
            date: 1.week.from_now,
            topic: 'Test Event with Duplicate Speaker Bug',
            speaker_ids: [speaker.id.to_s]
          }

          expect {
            post admin_past_events_url, params: { past_event: create_params }
          }.to change(SpeakerAssignment, :count).by(1)
        end

        it 'does not create duplicate speaker assignment records' do
          create_params = {
            date: 1.week.from_now,
            topic: 'Test Event with Duplicate Speaker Bug',
            speaker_ids: [speaker.id.to_s]
          }

          post admin_past_events_url, params: { past_event: create_params }
          new_past_event = PastEvent.last

          expect(new_past_event.speaker_assignments.count).to eq(1)
        end

        it 'creates unique speaker assignment pairs' do
          create_params = {
            date: 1.week.from_now,
            topic: 'Test Event with Duplicate Speaker Bug',
            speaker_ids: [speaker.id.to_s]
          }

          post admin_past_events_url, params: { past_event: create_params }
          new_past_event = PastEvent.last
          speaker_assignment_pairs = new_past_event.speaker_assignments.pluck(:past_event_id, :speaker_id)

          expect(speaker_assignment_pairs.uniq.length).to eq(speaker_assignment_pairs.length)
        end
      end

      context 'with invalid parameters' do
        it 'does not create a new PastEvent' do
          expect {
            post admin_past_events_url, params: { past_event: invalid_attributes }
          }.not_to change(PastEvent, :count)
        end

        it "renders a successful response (i.e. to display the 'new' template)" do
          post admin_past_events_url, params: { past_event: invalid_attributes }
          expect(response).to be_successful
        end
      end
    end
  end

  describe 'PATCH /update' do
    context 'when NOT logged in' do
      it 'redirects to the root path' do
        patch admin_past_event_url(past_event), params: { past_event: valid_attributes }
        expect(response).to redirect_to(root_path)
      end
    end

    context 'when logged in' do
      before { sign_in_as(admin_user) }

      context 'with valid parameters' do
        it 'updates the requested admin_past_event' do
          new_topic = "Updated #{past_event.topic}!"
          update_attributes = { date: past_event.date, topic: new_topic }
          patch admin_past_event_url(past_event), params: { past_event: update_attributes }
          past_event.reload
          expect(past_event.topic).to eq(new_topic)
        end

        it 'redirects to the admin_past_event' do
          new_topic = "Updated #{past_event.topic}!"
          update_attributes = { date: past_event.date, topic: new_topic }
          patch admin_past_event_url(past_event), params: { past_event: update_attributes }
          expect(response).to redirect_to(admin_past_event_url(past_event))
        end
      end

      context 'with invalid parameters' do
        it "renders an 'edit' template" do
          patch admin_past_event_url(past_event), params: { past_event: invalid_attributes }
          expect(response.body).to include('Editing Past Event')
        end
      end
    end
  end

  describe 'DELETE /destroy' do
    context 'when NOT logged in' do
      it 'redirects to the root path' do
        delete admin_past_event_url(past_event)
        expect(response).to redirect_to(root_path)
      end
    end

    context 'when logged in' do
      before { sign_in_as(admin_user) }

      it 'destroys the requested admin_past_event' do
        expect {
          delete admin_past_event_url(past_event)
        }.to change(PastEvent, :count).by(-1)
      end

      it 'redirects to the admin_past_events list' do
        delete admin_past_event_url(past_event)
        expect(response).to redirect_to(admin_past_events_url)
      end
    end
  end
end
