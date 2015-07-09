require 'rails_helper'

RSpec.describe "activities/index", :type => :view do
  before(:each) do
    assign(:activities, [
      Activity.create!(
        :title => "Title",
        :content => "Content",
        :activity_type => "Activity Type"
      ),
      Activity.create!(
        :title => "Title",
        :content => "Content",
        :activity_type => "Activity Type"
      )
    ])
  end

  it "renders a list of activities" do
    render
    assert_select "tr>td", :text => "Title".to_s, :count => 2
    assert_select "tr>td", :text => "Content".to_s, :count => 2
    assert_select "tr>td", :text => "Activity Type".to_s, :count => 2
  end
end
