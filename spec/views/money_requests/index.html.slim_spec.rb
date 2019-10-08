require 'rails_helper'

RSpec.describe "money_requests/index", type: :view do
  before(:each) do
    assign(:money_requests, [
      MoneyRequest.create!(
        :user => nil,
        :department => nil,
        :amount_cash => 2,
        :amount_bank => 3
      ),
      MoneyRequest.create!(
        :user => nil,
        :department => nil,
        :amount_cash => 2,
        :amount_bank => 3
      )
    ])
  end

  it "renders a list of money_requests" do
    render
    assert_select "tr>td", :text => nil.to_s, :count => 2
    assert_select "tr>td", :text => nil.to_s, :count => 2
    assert_select "tr>td", :text => 2.to_s, :count => 2
    assert_select "tr>td", :text => 3.to_s, :count => 2
  end
end
