require 'rails_helper'

RSpec.describe "MoneyRequests", type: :request do
  describe "GET /money_requests" do
    it "works! (now write some real specs)" do
      get money_requests_path
      expect(response).to have_http_status(200)
    end
  end
end
