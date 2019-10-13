require 'rails_helper'

RSpec.describe "conference_records/index", type: :view do
  before(:each) do
    assign(:conference_records, [
      ConferenceRecord.create!(
        :name => "Name",
        :description => "Description",
        :parent_id => 2,
        :user => nil,
        :department => nil,
        :admin => false
      ),
      ConferenceRecord.create!(
        :name => "Name",
        :description => "Description",
        :parent_id => 2,
        :user => nil,
        :department => nil,
        :admin => false
      )
    ])
  end

  it "renders a list of conference_records" do
    render
    assert_select "tr>td", :text => "Name".to_s, :count => 2
    assert_select "tr>td", :text => "Description".to_s, :count => 2
    assert_select "tr>td", :text => 2.to_s, :count => 2
    assert_select "tr>td", :text => nil.to_s, :count => 2
    assert_select "tr>td", :text => nil.to_s, :count => 2
    assert_select "tr>td", :text => false.to_s, :count => 2
  end
end
