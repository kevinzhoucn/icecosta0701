require 'rails_helper'

RSpec.describe "activities/edit", :type => :view do
  before(:each) do
    @activity = assign(:activity, Activity.create!(
      :title => "MyString",
      :content => "MyString",
      :activity_type => "MyString"
    ))
  end

  it "renders the edit activity form" do
    render

    assert_select "form[action=?][method=?]", activity_path(@activity), "post" do

      assert_select "input#activity_title[name=?]", "activity[title]"

      assert_select "input#activity_content[name=?]", "activity[content]"

      assert_select "input#activity_activity_type[name=?]", "activity[activity_type]"
    end
  end
end
