require "spec_helper"

describe AccessTokensController do
  describe "routing" do

    it "routes to #index" do
      get("/access_tokens").should route_to("access_tokens#index")
    end

    it "routes to #new" do
      get("/access_tokens/new").should route_to("access_tokens#new")
    end

    it "routes to #show" do
      get("/access_tokens/1").should route_to("access_tokens#show", :id => "1")
    end

    it "routes to #edit" do
      get("/access_tokens/1/edit").should route_to("access_tokens#edit", :id => "1")
    end

    it "routes to #create" do
      post("/access_tokens").should route_to("access_tokens#create")
    end

    it "routes to #update" do
      put("/access_tokens/1").should route_to("access_tokens#update", :id => "1")
    end

    it "routes to #destroy" do
      delete("/access_tokens/1").should route_to("access_tokens#destroy", :id => "1")
    end

  end
end
