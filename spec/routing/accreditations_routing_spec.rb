require "spec_helper"

describe AccreditationsController do
  describe "routing" do

    it "routes to #index" do
      get("/accreditations").should route_to("accreditations#index")
    end

    it "routes to #new" do
      get("/accreditations/new").should route_to("accreditations#new")
    end

    it "routes to #show" do
      get("/accreditations/1").should route_to("accreditations#show", :id => "1")
    end

    it "routes to #edit" do
      get("/accreditations/1/edit").should route_to("accreditations#edit", :id => "1")
    end

    it "routes to #create" do
      post("/accreditations").should route_to("accreditations#create")
    end

    it "routes to #update" do
      put("/accreditations/1").should route_to("accreditations#update", :id => "1")
    end

    it "routes to #destroy" do
      delete("/accreditations/1").should route_to("accreditations#destroy", :id => "1")
    end

  end
end
