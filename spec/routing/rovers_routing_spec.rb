require "rails_helper"

RSpec.describe RoversController, type: :routing do
  describe "routing" do

    it "routes to #index" do
      expect(:get => "/rovers").to route_to("rovers#index")
    end

    it "routes to #new" do
      expect(:get => "/rovers/new").to route_to("rovers#new")
    end

    it "routes to #show" do
      expect(:get => "/rovers/1").to route_to("rovers#show", :id => "1")
    end

    it "routes to #edit" do
      expect(:get => "/rovers/1/edit").to route_to("rovers#edit", :id => "1")
    end

    it "routes to #create" do
      expect(:post => "/rovers").to route_to("rovers#create")
    end

    it "routes to #update via PUT" do
      expect(:put => "/rovers/1").to route_to("rovers#update", :id => "1")
    end

    it "routes to #update via PATCH" do
      expect(:patch => "/rovers/1").to route_to("rovers#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/rovers/1").to route_to("rovers#destroy", :id => "1")
    end

  end
end
