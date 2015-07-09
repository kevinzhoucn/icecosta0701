require 'rails_helper'

RSpec.describe "resumes/new", :type => :view do
  before(:each) do
    assign(:resume, Resume.new(
      :title => "MyString",
      :content => "MyString",
      :resume_type => "MyString"
    ))
  end

  it "renders new resume form" do
    render

    assert_select "form[action=?][method=?]", resumes_path, "post" do

      assert_select "input#resume_title[name=?]", "resume[title]"

      assert_select "input#resume_content[name=?]", "resume[content]"

      assert_select "input#resume_resume_type[name=?]", "resume[resume_type]"
    end
  end
end
