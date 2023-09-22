require "rails_helper"

RSpec.describe Admin::PastEventsController do
  describe "routing" do
    it "routes to #create" do
      expect(post: "/admin/past_events").to route_to("admin/past_events#create")
    end

    it "routes to #destroy" do
      expect(delete: "/admin/past_events/1").to route_to("admin/past_events#destroy", id: "1")
    end

    it "routes to #edit" do
      expect(get: "/admin/past_events/1/edit").to route_to("admin/past_events#edit", id: "1")
    end

    it "routes to #index" do
      expect(get: "/admin/past_events").to route_to("admin/past_events#index")
    end

    it "routes to #new" do
      expect(get: "/admin/past_events/new").to route_to("admin/past_events#new")
    end

    it "routes to #show" do
      expect(get: "/admin/past_events/1").to route_to("admin/past_events#show", id: "1")
    end

    it "routes to #update via PUT" do
      expect(put: "/admin/past_events/1").to route_to("admin/past_events#update", id: "1")
    end

    it "routes to #update via PATCH" do
      expect(patch: "/admin/past_events/1").to route_to("admin/past_events#update", id: "1")
    end
  end
end
