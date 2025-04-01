require 'rails_helper'

RSpec.describe PagesController, type: :controller do
  describe 'GET #index' do
    it 'is publicly accessible' do
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
