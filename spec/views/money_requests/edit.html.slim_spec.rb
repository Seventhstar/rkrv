require 'rails_helper'

RSpec.describe "money_requests/edit", type: :view do
  before(:each) do
    @money_request = assign(:money_request, MoneyRequest.create!(
      :user => nil,
      :department => nil,
      :amount_cash => 1,
      :amount_bank => 1
    ))
  end

  it "renders the edit money_request form" do
    render

    assert_select "form[action=?][method=?]", money_request_path(@money_request), "post" do

      assert_select "input[name=?]", "money_request[user_id]"

      assert_select "input[name=?]", "money_request[department_id]"

      assert_select "input[name=?]", "money_request[amount_cash]"

      assert_select "input[name=?]", "money_request[amount_bank]"
    end
  end
end
