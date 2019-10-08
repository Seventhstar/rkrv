require "rails_helper"

RSpec.describe SalaryPaymentsController, type: :routing do
  describe "routing" do
    it "routes to #index" do
      expect(:get => "/salary_payments").to route_to("salary_payments#index")
    end

    it "routes to #new" do
      expect(:get => "/salary_payments/new").to route_to("salary_payments#new")
    end

    it "routes to #show" do
      expect(:get => "/salary_payments/1").to route_to("salary_payments#show", :id => "1")
    end

    it "routes to #edit" do
      expect(:get => "/salary_payments/1/edit").to route_to("salary_payments#edit", :id => "1")
    end


    it "routes to #create" do
      expect(:post => "/salary_payments").to route_to("salary_payments#create")
    end

    it "routes to #update via PUT" do
      expect(:put => "/salary_payments/1").to route_to("salary_payments#update", :id => "1")
    end

    it "routes to #update via PATCH" do
      expect(:patch => "/salary_payments/1").to route_to("salary_payments#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/salary_payments/1").to route_to("salary_payments#destroy", :id => "1")
    end
  end
end
