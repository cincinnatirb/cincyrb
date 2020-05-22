require 'rails_helper'

RSpec.describe PagesController, type: :controller do
  describe 'GET #index' do

    it 'is publicly accessible' do
      VCR.use_cassette('pages_controller_spec-get-index') { get :index, params: {} }
      expect(response.code).to eq('200')
    end
  end
end
