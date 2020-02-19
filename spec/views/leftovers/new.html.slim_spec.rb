require 'rails_helper'

RSpec.describe "leftovers/new", type: :view do
  before(:each) do
    assign(:leftover, Leftover.new(
      :safe_id => 1,
      :organization_id => 1,
      :calculated => "",
      :by_hand => ""
    ))
  end

  it "renders new leftover form" do
    render

    assert_select "form[action=?][method=?]", leftovers_path, "post" do

      assert_select "input[name=?]", "leftover[safe_id]"

      assert_select "input[name=?]", "leftover[organization_id]"

      assert_select "input[name=?]", "leftover[calculated]"

      assert_select "input[name=?]", "leftover[by_hand]"
    end
  end
end
