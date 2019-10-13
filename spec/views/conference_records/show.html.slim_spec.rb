require 'rails_helper'

RSpec.describe "conference_records/show", type: :view do
  before(:each) do
    @conference_record = assign(:conference_record, ConferenceRecord.create!(
      :name => "Name",
      :description => "Description",
      :parent_id => 2,
      :user => nil,
      :department => nil,
      :admin => false
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Name/)
    expect(rendered).to match(/Description/)
    expect(rendered).to match(/2/)
    expect(rendered).to match(//)
    expect(rendered).to match(//)
    expect(rendered).to match(/false/)
  end
end
