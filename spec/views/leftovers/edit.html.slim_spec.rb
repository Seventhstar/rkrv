require 'rails_helper'

RSpec.describe "leftovers/edit", type: :view do
  before(:each) do
    @leftover = assign(:leftover, Leftover.create!(
      :safe_id => 1,
      :organization_id => 1,
      :calculated => "",
      :by_hand => ""
    ))
  end

  it "renders the edit leftover form" do
    render

    assert_select "form[action=?][method=?]", leftover_path(@leftover), "post" do

      assert_select "input[name=?]", "leftover[safe_id]"

      assert_select "input[name=?]", "leftover[organization_id]"

      assert_select "input[name=?]", "leftover[calculated]"

      assert_select "input[name=?]", "leftover[by_hand]"
    end
  end
end
