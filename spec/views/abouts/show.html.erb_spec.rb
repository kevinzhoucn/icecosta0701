require 'rails_helper'

RSpec.describe "abouts/show", :type => :view do
  before(:each) do
    @about = assign(:about, About.create!(
      :title => "Title",
      :content => "Content",
      :lang => "Lang"
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Title/)
    expect(rendered).to match(/Content/)
    expect(rendered).to match(/Lang/)
  end
end
