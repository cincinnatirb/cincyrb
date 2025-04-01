require 'rails_helper'

RSpec.describe PastEventsController, type: :controller do
  describe 'GET #index' do
    it 'is publicly accessible' do
      expect(response).to have_http_status(:ok)
    end
  end

  describe 'GET #show' do
    it 'is publicly accessible' do
      get :show, params: { year: '2005', month: '2' }

      expect(response).to have_http_status(:ok)
    end
  end
end
