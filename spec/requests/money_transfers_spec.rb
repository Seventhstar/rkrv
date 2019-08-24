require 'rails_helper'

RSpec.describe "MoneyTransfers", type: :request do
  describe "GET /money_transfers" do
    it "works! (now write some real specs)" do
      get money_transfers_path
      expect(response).to have_http_status(200)
    end
  end
end
