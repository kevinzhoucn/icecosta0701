require 'rails_helper'

RSpec.describe "positions/new", :type => :view do
  before(:each) do
    assign(:position, Position.new(
      :title => "MyString",
      :content => "MyString",
      :position_type => "MyString"
    ))
  end

  it "renders new position form" do
    render

    assert_select "form[action=?][method=?]", positions_path, "post" do

      assert_select "input#position_title[name=?]", "position[title]"

      assert_select "input#position_content[name=?]", "position[content]"

      assert_select "input#position_position_type[name=?]", "position[position_type]"
    end
  end
end
