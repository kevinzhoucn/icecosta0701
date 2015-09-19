require 'rails_helper'

RSpec.describe "abouts/edit", :type => :view do
  before(:each) do
    @about = assign(:about, About.create!(
      :title => "MyString",
      :content => "MyString",
      :lang => "MyString"
    ))
  end

  it "renders the edit about form" do
    render

    assert_select "form[action=?][method=?]", about_path(@about), "post" do

      assert_select "input#about_title[name=?]", "about[title]"

      assert_select "input#about_content[name=?]", "about[content]"

      assert_select "input#about_lang[name=?]", "about[lang]"
    end
  end
end
