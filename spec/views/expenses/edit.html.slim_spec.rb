require 'rails_helper'

RSpec.describe "expenses/edit", type: :view do
  before(:each) do
    @expense = assign(:expense, Expense.create!(
      :amount => 1,
      :safe => nil,
      :expense_type => nil,
      :department => nil,
      :comment => "MyString"
    ))
  end

  it "renders the edit expense form" do
    render

    assert_select "form[action=?][method=?]", expense_path(@expense), "post" do

      assert_select "input[name=?]", "expense[amount]"

      assert_select "input[name=?]", "expense[safe_id]"

      assert_select "input[name=?]", "expense[expense_type_id]"

      assert_select "input[name=?]", "expense[department_id]"

      assert_select "input[name=?]", "expense[comment]"
    end
  end
end
