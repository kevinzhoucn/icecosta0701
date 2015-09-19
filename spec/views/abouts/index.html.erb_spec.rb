require 'rails_helper'

RSpec.describe "abouts/index", :type => :view do
  before(:each) do
    assign(:abouts, [
      About.create!(
        :title => "Title",
        :content => "Content",
        :lang => "Lang"
      ),
      About.create!(
        :title => "Title",
        :content => "Content",
        :lang => "Lang"
      )
    ])
  end

  it "renders a list of abouts" do
    render
    assert_select "tr>td", :text => "Title".to_s, :count => 2
    assert_select "tr>td", :text => "Content".to_s, :count => 2
    assert_select "tr>td", :text => "Lang".to_s, :count => 2
  end
end
