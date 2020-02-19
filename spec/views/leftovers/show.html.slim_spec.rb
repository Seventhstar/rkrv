require 'rails_helper'

RSpec.describe "leftovers/show", type: :view do
  before(:each) do
    @leftover = assign(:leftover, Leftover.create!(
      :safe_id => 2,
      :organization_id => 3,
      :calculated => "",
      :by_hand => ""
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/2/)
    expect(rendered).to match(/3/)
    expect(rendered).to match(//)
    expect(rendered).to match(//)
  end
end
