require 'rails_helper'

RSpec.describe "employers/index", :type => :view do
  before(:each) do
    assign(:employers, [
      Employer.create!(
        :title => "Title",
        :content => "Content",
        :employer_type => "Employer Type"
      ),
      Employer.create!(
        :title => "Title",
        :content => "Content",
        :employer_type => "Employer Type"
      )
    ])
  end

  it "renders a list of employers" do
    render
    assert_select "tr>td", :text => "Title".to_s, :count => 2
    assert_select "tr>td", :text => "Content".to_s, :count => 2
    assert_select "tr>td", :text => "Employer Type".to_s, :count => 2
  end
end
