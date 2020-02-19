require 'rails_helper'

RSpec.describe "leftovers/index", type: :view do
  before(:each) do
    assign(:leftovers, [
      Leftover.create!(
        :safe_id => 2,
        :organization_id => 3,
        :calculated => "",
        :by_hand => ""
      ),
      Leftover.create!(
        :safe_id => 2,
        :organization_id => 3,
        :calculated => "",
        :by_hand => ""
      )
    ])
  end

  it "renders a list of leftovers" do
    render
    assert_select "tr>td", :text => 2.to_s, :count => 2
    assert_select "tr>td", :text => 3.to_s, :count => 2
    assert_select "tr>td", :text => "".to_s, :count => 2
    assert_select "tr>td", :text => "".to_s, :count => 2
  end
end
