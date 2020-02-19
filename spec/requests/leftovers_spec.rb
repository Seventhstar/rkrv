require 'rails_helper'

RSpec.describe "Leftovers", type: :request do
  describe "GET /leftovers" do
    it "works! (now write some real specs)" do
      get leftovers_path
      expect(response).to have_http_status(200)
    end
  end
end
