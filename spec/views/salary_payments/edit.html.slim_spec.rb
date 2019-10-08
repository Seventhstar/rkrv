require 'rails_helper'

RSpec.describe "salary_payments/edit", type: :view do
  before(:each) do
    @salary_payment = assign(:salary_payment, SalaryPayment.create!(
      :depertment => nil,
      :user => nil,
      :amount => 1
    ))
  end

  it "renders the edit salary_payment form" do
    render

    assert_select "form[action=?][method=?]", salary_payment_path(@salary_payment), "post" do

      assert_select "input[name=?]", "salary_payment[depertment_id]"

      assert_select "input[name=?]", "salary_payment[user_id]"

      assert_select "input[name=?]", "salary_payment[amount]"
    end
  end
end
