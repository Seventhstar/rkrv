require 'rails_helper'

RSpec.describe "staffs/index", type: :view do
  before(:each) do
    assign(:staffs, [
      Staff.create!(
        :name => "Name",
        :phone => "Phone",
        :department => nil
      ),
      Staff.create!(
        :name => "Name",
        :phone => "Phone",
        :department => nil
      )
    ])
  end

  it "renders a list of staffs" do
    render
    assert_select "tr>td", :text => "Name".to_s, :count => 2
    assert_select "tr>td", :text => "Phone".to_s, :count => 2
    assert_select "tr>td", :text => nil.to_s, :count => 2
  end
end
