require 'rails_helper'

RSpec.describe '/admin/speakers' do
  let!(:admin_user) { create(:admin_user, password: 'P4ssw0rd!') }
  let!(:speaker) { create(:speaker) }
  let(:valid_attributes) { { name: Faker::Name.unique.name } }
  let(:invalid_attributes) { { name: nil } }

  describe 'GET /index' do
    context 'when NOT logged in' do
      it 'redirects to the root path' do
        get admin_speakers_url
        expect(response).to redirect_to(root_path)
      end
    end

    context 'when logged in' do
      before { sign_in_as(admin_user) }

      it 'renders a successful response' do
        get admin_speakers_url
        expect(response).to be_successful
      end
    end
  end

  describe 'GET /show' do
    context 'when NOT logged in' do
      it 'redirects to the root path' do
        get admin_speaker_url(speaker)
        expect(response).to redirect_to(root_path)
      end
    end

    context 'when logged in' do
      before { sign_in_as(admin_user) }

      it 'renders a successful response' do
        get admin_speaker_url(speaker)
        expect(response).to be_successful
      end
    end
  end

  describe 'GET /new' do
    context 'when NOT logged in' do
      it 'redirects to the root path' do
        get new_admin_speaker_url
        expect(response).to redirect_to(root_path)
      end
    end

    context 'when logged in' do
      before { sign_in_as(admin_user) }

      it 'renders a successful response' do
        get new_admin_speaker_url
        expect(response).to be_successful
      end
    end
  end

  describe 'GET /edit' do
    context 'when NOT logged in' do
      it 'redirects to the root path' do
        get edit_admin_speaker_url(speaker)
        expect(response).to redirect_to(root_path)
      end
    end

    context 'when logged in' do
      before { sign_in_as(admin_user) }

      it 'render a successful response' do
        get edit_admin_speaker_url(speaker)
        expect(response).to be_successful
      end
    end
  end

  describe 'POST /create' do
    context 'when NOT logged in' do
      it 'redirects to the root path' do
        post admin_speakers_url, params: { speaker: valid_attributes }
        expect(response).to redirect_to(root_path)
      end
    end

    context 'when logged in' do
      before { sign_in_as(admin_user) }

      context 'with valid parameters' do
        it 'creates a new Speaker' do
          expect {
            post admin_speakers_url, params: { speaker: valid_attributes }
          }.to change(Speaker, :count).by(1)
        end

        it 'redirects to the created Speaker' do
          post admin_speakers_url, params: { speaker: valid_attributes }
          expect(response).to redirect_to(admin_speaker_url(Speaker.last))
        end
      end

      context 'with invalid parameters' do
        it 'does not create a new Speaker' do
          expect {
            post admin_speakers_url, params: { speaker: invalid_attributes }
          }.not_to change(Speaker, :count)
        end

        it "renders a successful response (i.e. to display the 'new' template)" do
          post admin_speakers_url, params: { speaker: invalid_attributes }
          expect(response).to be_successful
        end
      end
    end
  end

  describe 'PATCH /update' do
    context 'when NOT logged in' do
      it 'redirects to the root path' do
        new_name = "#{speaker.name}, Ph.D."
        update_attributes = { name: new_name }
        patch admin_speaker_url(speaker), params: { speaker: update_attributes }
        expect(response).to redirect_to(root_path)
      end
    end

    context 'when logged in' do
      before { sign_in_as(admin_user) }

      context 'with valid parameters' do
        it 'updates the requested admin_speaker' do
          new_name = "#{speaker.name}, Ph.D."
          update_attributes = { name: new_name }
          patch admin_speaker_url(speaker), params: { speaker: update_attributes }
          speaker.reload
          expect(speaker.name).to eq(new_name)
        end

        it 'redirects to the admin_speaker' do
          new_name = "#{speaker.name}, Ph.D."
          update_attributes = { name: new_name }
          patch admin_speaker_url(speaker), params: { speaker: update_attributes }
          expect(response).to redirect_to(admin_speaker_url(speaker))
        end
      end

      context 'with invalid parameters' do
        it "renders a successful response (i.e. to display the 'edit' template)" do
          patch admin_speaker_url(speaker), params: { speaker: invalid_attributes }
          expect(response).to be_successful
        end
      end
    end
  end

  describe 'DELETE /destroy' do
    context 'when NOT logged in' do
      it 'redirects to the root path' do
        delete admin_speaker_url(speaker)
        expect(response).to redirect_to(root_path)
      end
    end

    context 'when logged in' do
      before { sign_in_as(admin_user) }

      it 'destroys the requested admin_speaker' do
        expect {
          delete admin_speaker_url(speaker)
        }.to change(Speaker, :count).by(-1)
      end

      it 'redirects to the admin_speakers list' do
        delete admin_speaker_url(speaker)
        expect(response).to redirect_to(admin_speakers_url)
      end
    end
  end
end
