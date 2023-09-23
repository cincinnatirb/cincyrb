require 'rails_helper'

module Devise
  RSpec.describe SessionsController do
    describe 'routing' do
      it 'routes to #new' do
        expect(get: '/admin/login').to route_to('devise/sessions#new')
      end

      it 'routes to #create' do
        expect(post: '/admin/login').to route_to('devise/sessions#create')
      end

      it 'routes to #destroy via DELETE' do
        expect(delete: '/admin/logout').to route_to('devise/sessions#destroy')
      end

      it 'routes to #destroy via GET' do
        expect(get: '/admin/logout').to route_to('devise/sessions#destroy')
      end
    end
  end

  RSpec.describe PasswordsController do
    describe 'routing' do
      it 'routes to #create' do
        expect(post: '/admin/password').to route_to('devise/passwords#create')
      end

      it 'routes to #edit' do
        expect(get: '/admin/password/edit').to route_to('devise/passwords#edit')
      end

      it 'routes to #new' do
        expect(get: '/admin/password/new').to route_to('devise/passwords#new')
      end

      it 'routes to #update via PATCH' do
        expect(patch: '/admin/password').to route_to('devise/passwords#update')
      end

      it 'routes to #update via PUT' do
        expect(put: '/admin/password').to route_to('devise/passwords#update')
      end
    end
  end
end
