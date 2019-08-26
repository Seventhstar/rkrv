require 'rails_helper'

RSpec.describe "staffs/new", type: :view do
  before(:each) do
    assign(:staff, Staff.new(
      :name => "MyString",
      :phone => "MyString",
      :department => nil
    ))
  end

  it "renders new staff form" do
    render

    assert_select "form[action=?][method=?]", staffs_path, "post" do

      assert_select "input[name=?]", "staff[name]"

      assert_select "input[name=?]", "staff[phone]"

      assert_select "input[name=?]", "staff[department_id]"
    end
  end
end
