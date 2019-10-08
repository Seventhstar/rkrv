require 'rails_helper'

RSpec.describe "money_requests/new", type: :view do
  before(:each) do
    assign(:money_request, MoneyRequest.new(
      :user => nil,
      :department => nil,
      :amount_cash => 1,
      :amount_bank => 1
    ))
  end

  it "renders new money_request form" do
    render

    assert_select "form[action=?][method=?]", money_requests_path, "post" do

      assert_select "input[name=?]", "money_request[user_id]"

      assert_select "input[name=?]", "money_request[department_id]"

      assert_select "input[name=?]", "money_request[amount_cash]"

      assert_select "input[name=?]", "money_request[amount_bank]"
    end
  end
end
