require 'rails_helper'

RSpec.describe "conference_records/new", type: :view do
  before(:each) do
    assign(:conference_record, ConferenceRecord.new(
      :name => "MyString",
      :description => "MyString",
      :parent_id => 1,
      :user => nil,
      :department => nil,
      :admin => false
    ))
  end

  it "renders new conference_record form" do
    render

    assert_select "form[action=?][method=?]", conference_records_path, "post" do

      assert_select "input[name=?]", "conference_record[name]"

      assert_select "input[name=?]", "conference_record[description]"

      assert_select "input[name=?]", "conference_record[parent_id]"

      assert_select "input[name=?]", "conference_record[user_id]"

      assert_select "input[name=?]", "conference_record[department_id]"

      assert_select "input[name=?]", "conference_record[admin]"
    end
  end
end
