require 'rails_helper'

RSpec.describe "salary_payments/show", type: :view do
  before(:each) do
    @salary_payment = assign(:salary_payment, SalaryPayment.create!(
      :depertment => nil,
      :user => nil,
      :amount => 2
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(//)
    expect(rendered).to match(//)
    expect(rendered).to match(/2/)
  end
end
