require 'rails_helper'

RSpec.describe "money_transfers/edit", type: :view do
  before(:each) do
    @money_transfer = assign(:money_transfer, MoneyTransfer.create!(
      :safe_from => nil,
      :safe_to => nil,
      :amount => 1,
      :comment => "MyString",
      :user => nil
    ))
  end

  it "renders the edit money_transfer form" do
    render

    assert_select "form[action=?][method=?]", money_transfer_path(@money_transfer), "post" do

      assert_select "input[name=?]", "money_transfer[safe_from_id]"

      assert_select "input[name=?]", "money_transfer[safe_to_id]"

      assert_select "input[name=?]", "money_transfer[amount]"

      assert_select "input[name=?]", "money_transfer[comment]"

      assert_select "input[name=?]", "money_transfer[user_id]"
    end
  end
end
