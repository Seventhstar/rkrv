require "rails_helper"

RSpec.describe LeftoversController, type: :routing do
  describe "routing" do
    it "routes to #index" do
      expect(:get => "/leftovers").to route_to("leftovers#index")
    end

    it "routes to #new" do
      expect(:get => "/leftovers/new").to route_to("leftovers#new")
    end

    it "routes to #show" do
      expect(:get => "/leftovers/1").to route_to("leftovers#show", :id => "1")
    end

    it "routes to #edit" do
      expect(:get => "/leftovers/1/edit").to route_to("leftovers#edit", :id => "1")
    end


    it "routes to #create" do
      expect(:post => "/leftovers").to route_to("leftovers#create")
    end

    it "routes to #update via PUT" do
      expect(:put => "/leftovers/1").to route_to("leftovers#update", :id => "1")
    end

    it "routes to #update via PATCH" do
      expect(:patch => "/leftovers/1").to route_to("leftovers#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/leftovers/1").to route_to("leftovers#destroy", :id => "1")
    end
  end
end
