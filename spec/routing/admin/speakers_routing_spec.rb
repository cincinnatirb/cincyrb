require "rails_helper"

RSpec.describe Admin::SpeakersController, type: :routing do
  describe "routing" do
    it "routes to #create" do
      expect(post: "/admin/speakers").to route_to("admin/speakers#create")
    end

    it "routes to #destroy" do
      expect(delete: "/admin/speakers/1").to route_to("admin/speakers#destroy", id: "1")
    end

    it "routes to #edit" do
      expect(get: "/admin/speakers/1/edit").to route_to("admin/speakers#edit", id: "1")
    end

    it "routes to #index" do
      expect(get: "/admin/speakers").to route_to("admin/speakers#index")
    end

    it "routes to #new" do
      expect(get: "/admin/speakers/new").to route_to("admin/speakers#new")
    end

    it "routes to #show" do
      expect(get: "/admin/speakers/1").to route_to("admin/speakers#show", id: "1")
    end

    it "routes to #update via PUT" do
      expect(put: "/admin/speakers/1").to route_to("admin/speakers#update", id: "1")
    end

    it "routes to #update via PATCH" do
      expect(patch: "/admin/speakers/1").to route_to("admin/speakers#update", id: "1")
    end
  end
end
