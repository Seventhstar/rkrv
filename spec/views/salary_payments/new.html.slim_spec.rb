require 'rails_helper'

RSpec.describe "salary_payments/new", type: :view do
  before(:each) do
    assign(:salary_payment, SalaryPayment.new(
      :depertment => nil,
      :user => nil,
      :amount => 1
    ))
  end

  it "renders new salary_payment form" do
    render

    assert_select "form[action=?][method=?]", salary_payments_path, "post" do

      assert_select "input[name=?]", "salary_payment[depertment_id]"

      assert_select "input[name=?]", "salary_payment[user_id]"

      assert_select "input[name=?]", "salary_payment[amount]"
    end
  end
end
