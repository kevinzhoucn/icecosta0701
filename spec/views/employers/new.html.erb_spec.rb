require 'rails_helper'

RSpec.describe "employers/new", :type => :view do
  before(:each) do
    assign(:employer, Employer.new(
      :title => "MyString",
      :content => "MyString",
      :employer_type => "MyString"
    ))
  end

  it "renders new employer form" do
    render

    assert_select "form[action=?][method=?]", employers_path, "post" do

      assert_select "input#employer_title[name=?]", "employer[title]"

      assert_select "input#employer_content[name=?]", "employer[content]"

      assert_select "input#employer_employer_type[name=?]", "employer[employer_type]"
    end
  end
end
