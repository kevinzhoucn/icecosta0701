require 'rails_helper'

RSpec.describe "services/edit", :type => :view do
  before(:each) do
    @service = assign(:service, Service.create!(
      :title => "MyString",
      :content => "MyString"
    ))
  end

  it "renders the edit service form" do
    render

    assert_select "form[action=?][method=?]", service_path(@service), "post" do

      assert_select "input#service_title[name=?]", "service[title]"

      assert_select "input#service_content[name=?]", "service[content]"
    end
  end
end
