require "spec_helper"

describe DirectoryNameCleanupPatternsController do
  describe "routing" do

    it "routes to #index" do
      get("/directory_name_cleanup_patterns").should route_to("directory_name_cleanup_patterns#index")
    end

    it "routes to #new" do
      get("/directory_name_cleanup_patterns/new").should route_to("directory_name_cleanup_patterns#new")
    end

    it "routes to #show" do
      get("/directory_name_cleanup_patterns/1").should route_to("directory_name_cleanup_patterns#show", :id => "1")
    end

    it "routes to #edit" do
      get("/directory_name_cleanup_patterns/1/edit").should route_to("directory_name_cleanup_patterns#edit", :id => "1")
    end

    it "routes to #create" do
      post("/directory_name_cleanup_patterns").should route_to("directory_name_cleanup_patterns#create")
    end

    it "routes to #update" do
      put("/directory_name_cleanup_patterns/1").should route_to("directory_name_cleanup_patterns#update", :id => "1")
    end

    it "routes to #destroy" do
      delete("/directory_name_cleanup_patterns/1").should route_to("directory_name_cleanup_patterns#destroy", :id => "1")
    end

  end
end
