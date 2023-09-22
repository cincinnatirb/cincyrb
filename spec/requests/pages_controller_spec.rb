require 'rails_helper'

RSpec.describe PagesController, type: :controller do
  describe 'GET #index' do
    it 'is publicly accessible' do
      VCR.use_cassette('pages_controller_spec-get-index', record: :new_episodes) { get :index, params: {} }
      expect(response).to have_http_status(:ok)
    end
  end

  describe 'GET #this_month_in_ruby' do
    it 'is publicly accessible' do
      get :this_month_in_ruby

      expect(response).to have_http_status(:ok)
    end
  end
end
