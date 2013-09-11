require "spec_helper"

describe GenresController do
  describe "routing" do

    it "routes to #index" do
      get("/genres").should route_to("genres#index")
    end

    it "routes to #new" do
      get("/genres/new").should route_to("genres#new")
    end

    it "routes to #show" do
      get("/genres/1").should route_to("genres#show", :id => "1")
    end

    it "routes to #edit" do
      get("/genres/1/edit").should route_to("genres#edit", :id => "1")
    end

    it "routes to #create" do
      post("/genres").should route_to("genres#create")
    end

    it "routes to #update" do
      put("/genres/1").should route_to("genres#update", :id => "1")
    end

    it "routes to #destroy" do
      delete("/genres/1").should route_to("genres#destroy", :id => "1")
    end

  end
end
