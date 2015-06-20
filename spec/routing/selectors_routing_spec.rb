require "rails_helper"

RSpec.describe SelectorsController, type: :routing do
  describe "routing" do

    it "routes to #index" do
      expect(:get => "/selectors").to route_to("selectors#index")
    end

    it "routes to #new" do
      expect(:get => "/selectors/new").to route_to("selectors#new")
    end

    it "routes to #show" do
      expect(:get => "/selectors/1").to route_to("selectors#show", :id => "1")
    end

    it "routes to #edit" do
      expect(:get => "/selectors/1/edit").to route_to("selectors#edit", :id => "1")
    end

    it "routes to #create" do
      expect(:post => "/selectors").to route_to("selectors#create")
    end

    it "routes to #update" do
      expect(:put => "/selectors/1").to route_to("selectors#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/selectors/1").to route_to("selectors#destroy", :id => "1")
    end

  end
end
