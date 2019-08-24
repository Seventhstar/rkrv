require 'rails_helper'

RSpec.describe "money_transfers/new", type: :view do
  before(:each) do
    assign(:money_transfer, MoneyTransfer.new(
      :safe_from => nil,
      :safe_to => nil,
      :amount => 1,
      :comment => "MyString",
      :user => nil
    ))
  end

  it "renders new money_transfer form" do
    render

    assert_select "form[action=?][method=?]", money_transfers_path, "post" do

      assert_select "input[name=?]", "money_transfer[safe_from_id]"

      assert_select "input[name=?]", "money_transfer[safe_to_id]"

      assert_select "input[name=?]", "money_transfer[amount]"

      assert_select "input[name=?]", "money_transfer[comment]"

      assert_select "input[name=?]", "money_transfer[user_id]"
    end
  end
end
