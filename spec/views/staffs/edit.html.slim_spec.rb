require 'rails_helper'

RSpec.describe "staffs/edit", type: :view do
  before(:each) do
    @staff = assign(:staff, Staff.create!(
      :name => "MyString",
      :phone => "MyString",
      :department => nil
    ))
  end

  it "renders the edit staff form" do
    render

    assert_select "form[action=?][method=?]", staff_path(@staff), "post" do

      assert_select "input[name=?]", "staff[name]"

      assert_select "input[name=?]", "staff[phone]"

      assert_select "input[name=?]", "staff[department_id]"
    end
  end
end
