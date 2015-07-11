require 'rails_helper'

RSpec.describe "slides/show", :type => :view do
  before(:each) do
    @slide = assign(:slide, Slide.create!(
      :title => "Title",
      :image_url => "Image Url"
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Title/)
    expect(rendered).to match(/Image Url/)
  end
end
