require 'rails_helper'

RSpec.describe "money_requests/show", type: :view do
  before(:each) do
    @money_request = assign(:money_request, MoneyRequest.create!(
      :user => nil,
      :department => nil,
      :amount_cash => 2,
      :amount_bank => 3
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(//)
    expect(rendered).to match(//)
    expect(rendered).to match(/2/)
    expect(rendered).to match(/3/)
  end
end
