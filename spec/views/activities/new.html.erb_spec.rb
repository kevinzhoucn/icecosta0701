require 'rails_helper'

RSpec.describe "activities/new", :type => :view do
  before(:each) do
    assign(:activity, Activity.new(
      :title => "MyString",
      :content => "MyString",
      :activity_type => "MyString"
    ))
  end

  it "renders new activity form" do
    render

    assert_select "form[action=?][method=?]", activities_path, "post" do

      assert_select "input#activity_title[name=?]", "activity[title]"

      assert_select "input#activity_content[name=?]", "activity[content]"

      assert_select "input#activity_activity_type[name=?]", "activity[activity_type]"
    end
  end
end
