require 'rails_helper'

RSpec.describe "employers/show", :type => :view do
  before(:each) do
    @employer = assign(:employer, Employer.create!(
      :title => "Title",
      :content => "Content",
      :employer_type => "Employer Type"
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Title/)
    expect(rendered).to match(/Content/)
    expect(rendered).to match(/Employer Type/)
  end
end
