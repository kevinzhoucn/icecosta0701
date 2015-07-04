require 'rails_helper'

RSpec.describe "positions/show", :type => :view do
  before(:each) do
    @position = assign(:position, Position.create!(
      :title => "Title",
      :content => "Content",
      :position_type => "Position Type"
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Title/)
    expect(rendered).to match(/Content/)
    expect(rendered).to match(/Position Type/)
  end
end
