require 'rails_helper'

RSpec.describe PastEventsController, type: :controller do
  describe 'GET #index' do
    it 'is publicly accessible' do
      VCR.use_cassette('past_events_controller_spec-get-index', record: :new_episodes) { get :index, params: {} }
      expect(response.code).to eq('200')
    end
  end

  describe 'GET #show' do
    it 'is publicly accessible' do
      get :show, params: { year: '2005', month: '2' }

      expect(response.code).to eq('200')
    end
  end
end
