require 'rails_helper'

RSpec.describe "money_transfers/show", type: :view do
  before(:each) do
    @money_transfer = assign(:money_transfer, MoneyTransfer.create!(
      :safe_from => nil,
      :safe_to => nil,
      :amount => 2,
      :comment => "Comment",
      :user => nil
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(//)
    expect(rendered).to match(//)
    expect(rendered).to match(/2/)
    expect(rendered).to match(/Comment/)
    expect(rendered).to match(//)
  end
end
