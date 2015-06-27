require 'rails_helper'

RSpec.describe "resumes/edit", :type => :view do
  before(:each) do
    @resume = assign(:resume, Resume.create!(
      :title => "MyString",
      :content => "MyString",
      :resume_type => "MyString"
    ))
  end

  it "renders the edit resume form" do
    render

    assert_select "form[action=?][method=?]", resume_path(@resume), "post" do

      assert_select "input#resume_title[name=?]", "resume[title]"

      assert_select "input#resume_content[name=?]", "resume[content]"

      assert_select "input#resume_resume_type[name=?]", "resume[resume_type]"
    end
  end
end
