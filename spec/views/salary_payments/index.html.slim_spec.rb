require 'rails_helper'

RSpec.describe "salary_payments/index", type: :view do
  before(:each) do
    assign(:salary_payments, [
      SalaryPayment.create!(
        :depertment => nil,
        :user => nil,
        :amount => 2
      ),
      SalaryPayment.create!(
        :depertment => nil,
        :user => nil,
        :amount => 2
      )
    ])
  end

  it "renders a list of salary_payments" do
    render
    assert_select "tr>td", :text => nil.to_s, :count => 2
    assert_select "tr>td", :text => nil.to_s, :count => 2
    assert_select "tr>td", :text => 2.to_s, :count => 2
  end
end
