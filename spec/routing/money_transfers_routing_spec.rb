require "rails_helper"

RSpec.describe MoneyTransfersController, type: :routing do
  describe "routing" do
    it "routes to #index" do
      expect(:get => "/money_transfers").to route_to("money_transfers#index")
    end

    it "routes to #new" do
      expect(:get => "/money_transfers/new").to route_to("money_transfers#new")
    end

    it "routes to #show" do
      expect(:get => "/money_transfers/1").to route_to("money_transfers#show", :id => "1")
    end

    it "routes to #edit" do
      expect(:get => "/money_transfers/1/edit").to route_to("money_transfers#edit", :id => "1")
    end


    it "routes to #create" do
      expect(:post => "/money_transfers").to route_to("money_transfers#create")
    end

    it "routes to #update via PUT" do
      expect(:put => "/money_transfers/1").to route_to("money_transfers#update", :id => "1")
    end

    it "routes to #update via PATCH" do
      expect(:patch => "/money_transfers/1").to route_to("money_transfers#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/money_transfers/1").to route_to("money_transfers#destroy", :id => "1")
    end
  end
end
