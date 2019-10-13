require 'rails_helper'

RSpec.describe "conference_records/edit", type: :view do
  before(:each) do
    @conference_record = assign(:conference_record, ConferenceRecord.create!(
      :name => "MyString",
      :description => "MyString",
      :parent_id => 1,
      :user => nil,
      :department => nil,
      :admin => false
    ))
  end

  it "renders the edit conference_record form" do
    render

    assert_select "form[action=?][method=?]", conference_record_path(@conference_record), "post" do

      assert_select "input[name=?]", "conference_record[name]"

      assert_select "input[name=?]", "conference_record[description]"

      assert_select "input[name=?]", "conference_record[parent_id]"

      assert_select "input[name=?]", "conference_record[user_id]"

      assert_select "input[name=?]", "conference_record[department_id]"

      assert_select "input[name=?]", "conference_record[admin]"
    end
  end
end
