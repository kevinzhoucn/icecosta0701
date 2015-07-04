require 'rails_helper'

RSpec.describe "activities/show", :type => :view do
  before(:each) do
    @activity = assign(:activity, Activity.create!(
      :title => "Title",
      :content => "Content",
      :activity_type => "Activity Type"
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Title/)
    expect(rendered).to match(/Content/)
    expect(rendered).to match(/Activity Type/)
  end
end
