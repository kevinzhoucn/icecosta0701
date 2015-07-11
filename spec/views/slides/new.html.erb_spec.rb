require 'rails_helper'

RSpec.describe "slides/new", :type => :view do
  before(:each) do
    assign(:slide, Slide.new(
      :title => "MyString",
      :image_url => "MyString"
    ))
  end

  it "renders new slide form" do
    render

    assert_select "form[action=?][method=?]", slides_path, "post" do

      assert_select "input#slide_title[name=?]", "slide[title]"

      assert_select "input#slide_image_url[name=?]", "slide[image_url]"
    end
  end
end
