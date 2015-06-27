require 'rails_helper'

RSpec.describe "resumes/show", :type => :view do
  before(:each) do
    @resume = assign(:resume, Resume.create!(
      :title => "Title",
      :content => "Content",
      :resume_type => "Resume Type"
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Title/)
    expect(rendered).to match(/Content/)
    expect(rendered).to match(/Resume Type/)
  end
end
