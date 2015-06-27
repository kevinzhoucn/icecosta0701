require 'rails_helper'

RSpec.describe "positions/index", :type => :view do
  before(:each) do
    assign(:positions, [
      Position.create!(
        :title => "Title",
        :content => "Content",
        :position_type => "Position Type"
      ),
      Position.create!(
        :title => "Title",
        :content => "Content",
        :position_type => "Position Type"
      )
    ])
  end

  it "renders a list of positions" do
    render
    assert_select "tr>td", :text => "Title".to_s, :count => 2
    assert_select "tr>td", :text => "Content".to_s, :count => 2
    assert_select "tr>td", :text => "Position Type".to_s, :count => 2
  end
end
