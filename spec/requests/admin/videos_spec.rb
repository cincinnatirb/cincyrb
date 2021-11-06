require 'rails_helper'
require 'securerandom'

RSpec.describe '/admin/videos', type: :request do
  let!(:admin_user) { create(:admin_user, password: 'P4ssw0rd!') }
  let!(:video) { create(:video) }
  let(:valid_attributes) { { past_event_id: video.past_event.id, url: Faker::Internet.url(host: 'example.com', path: "/videos/#{SecureRandom.alphanumeric(8)}") } }
  let(:invalid_attributes) { { past_event_id: video.past_event.id, url: nil } }

  describe 'GET /index' do
    context 'when NOT logged in' do
      it 'redirects to the root path' do
        get admin_videos_url
        expect(response).to redirect_to(root_path)
      end
    end

    context 'when logged in' do
      before { sign_in_as(admin_user) }

      it 'renders a successful response' do
        get admin_videos_url
        expect(response).to be_successful
      end
    end
  end

  describe 'GET /show' do
    context 'when NOT logged in' do
      it 'redirects to the root path' do
        get admin_video_url(video)
        expect(response).to redirect_to(root_path)
      end
    end

    context 'when logged in' do
      before { sign_in_as(admin_user) }

      it 'renders a successful response' do
        get admin_video_url(video)
        expect(response).to be_successful
      end
    end
  end

  describe 'GET /new' do
    context 'when NOT logged in' do
      it 'redirects to the root path' do
        get new_admin_video_url
        expect(response).to redirect_to(root_path)
      end
    end

    context 'when logged in' do
      before { sign_in_as(admin_user) }

      it 'renders a successful response' do
        get new_admin_video_url
        expect(response).to be_successful
      end
    end
  end

  describe 'GET /edit' do
    context 'when NOT logged in' do
      it 'redirects to the root path' do
        get edit_admin_video_url(video)
        expect(response).to redirect_to(root_path)
      end
    end

    context 'when logged in' do
      before { sign_in_as(admin_user) }

      it 'render a successful response' do
        get edit_admin_video_url(video)
        expect(response).to be_successful
      end
    end
  end

  describe 'POST /create' do
    context 'when NOT logged in' do
      it 'redirects to the root path' do
        post admin_videos_url, params: { video: valid_attributes }
        expect(response).to redirect_to(root_path)
      end
    end

    context 'when logged in' do
      before { sign_in_as(admin_user) }

      context 'with valid parameters' do
        it 'creates a new video' do
          expect {
            post admin_videos_url, params: { video: valid_attributes }
          }.to change(Video, :count).by(1)
        end

        it 'redirects to the created video' do
          post admin_videos_url, params: { video: valid_attributes }
          expect(response).to redirect_to(admin_video_url(Video.last))
        end
      end

      context 'with invalid parameters' do
        it 'does not create a new video' do
          expect {
            post admin_videos_url, params: { video: invalid_attributes }
          }.to change(Video, :count).by(0)
        end

        it "renders a successful response (i.e. to display the 'new' template)" do
          post admin_videos_url, params: { video: invalid_attributes }
          expect(response).to be_successful
        end
      end
    end
  end

  describe 'PATCH /update' do
    context 'when NOT logged in' do
      it 'redirects to the root path' do
        new_url = "#{video.url}v2"
        update_attributes = { url: new_url }
        patch admin_video_url(video), params: { video: update_attributes }
        expect(response).to redirect_to(root_path)
      end
    end

    context 'when logged in' do
      before { sign_in_as(admin_user) }

      context 'with valid parameters' do
        it 'updates the requested admin_video' do
          new_url = "#{video.url}v2"
          update_attributes = { url: new_url }
          patch admin_video_url(video), params: { video: update_attributes }
          video.reload
          expect(video.url).to eq(new_url)
        end

        it 'redirects to the admin_video' do
          new_url = "#{video.url}v2"
          update_attributes = { url: new_url }
          patch admin_video_url(video), params: { video: update_attributes }
          expect(response).to redirect_to(admin_video_url(video))
        end
      end

      context 'with invalid parameters' do
        it "renders a successful response (i.e. to display the 'edit' template)" do
          patch admin_video_url(video), params: { video: invalid_attributes }
          expect(response).to be_successful
        end
      end
    end
  end

  describe 'DELETE /destroy' do
    context 'when NOT logged in' do
      it 'redirects to the root path' do
        delete admin_video_url(video)
        expect(response).to redirect_to(root_path)
      end
    end

    context 'when logged in' do
      before { sign_in_as(admin_user) }

      it 'destroys the requested admin_video' do
        expect {
          delete admin_video_url(video)
        }.to change(Video, :count).by(-1)
      end

      it 'redirects to the admin_videos list' do
        delete admin_video_url(video)
        expect(response).to redirect_to(admin_videos_url)
      end
    end
  end
end
