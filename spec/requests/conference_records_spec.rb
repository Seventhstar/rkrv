require 'rails_helper'

RSpec.describe "ConferenceRecords", type: :request do
  describe "GET /conference_records" do
    it "works! (now write some real specs)" do
      get conference_records_path
      expect(response).to have_http_status(200)
    end
  end
end
