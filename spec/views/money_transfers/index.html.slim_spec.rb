require 'rails_helper'

RSpec.describe "money_transfers/index", type: :view do
  before(:each) do
    assign(:money_transfers, [
      MoneyTransfer.create!(
        :safe_from => nil,
        :safe_to => nil,
        :amount => 2,
        :comment => "Comment",
        :user => nil
      ),
      MoneyTransfer.create!(
        :safe_from => nil,
        :safe_to => nil,
        :amount => 2,
        :comment => "Comment",
        :user => nil
      )
    ])
  end

  it "renders a list of money_transfers" do
    render
    assert_select "tr>td", :text => nil.to_s, :count => 2
    assert_select "tr>td", :text => nil.to_s, :count => 2
    assert_select "tr>td", :text => 2.to_s, :count => 2
    assert_select "tr>td", :text => "Comment".to_s, :count => 2
    assert_select "tr>td", :text => nil.to_s, :count => 2
  end
end
