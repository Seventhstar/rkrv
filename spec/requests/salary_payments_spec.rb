require 'rails_helper'

RSpec.describe "SalaryPayments", type: :request do
  describe "GET /salary_payments" do
    it "works! (now write some real specs)" do
      get salary_payments_path
      expect(response).to have_http_status(200)
    end
  end
end
