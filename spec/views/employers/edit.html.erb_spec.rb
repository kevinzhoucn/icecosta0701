require 'rails_helper'

RSpec.describe "employers/edit", :type => :view do
  before(:each) do
    @employer = assign(:employer, Employer.create!(
      :title => "MyString",
      :content => "MyString",
      :employer_type => "MyString"
    ))
  end

  it "renders the edit employer form" do
    render

    assert_select "form[action=?][method=?]", employer_path(@employer), "post" do

      assert_select "input#employer_title[name=?]", "employer[title]"

      assert_select "input#employer_content[name=?]", "employer[content]"

      assert_select "input#employer_employer_type[name=?]", "employer[employer_type]"
    end
  end
end
