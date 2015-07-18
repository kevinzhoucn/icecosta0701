require 'rails_helper'

RSpec.describe "pictures/edit", :type => :view do
  before(:each) do
    @picture = assign(:picture, Picture.create!(
      :key => "MyString",
      :value => "MyString"
    ))
  end

  it "renders the edit picture form" do
    render

    assert_select "form[action=?][method=?]", picture_path(@picture), "post" do

      assert_select "input#picture_key[name=?]", "picture[key]"

      assert_select "input#picture_value[name=?]", "picture[value]"
    end
  end
end
