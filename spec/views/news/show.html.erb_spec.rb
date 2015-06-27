require 'rails_helper'

RSpec.describe "news/show", :type => :view do
  before(:each) do
    @news = assign(:news, News.create!(
      :title => "Title",
      :content => "Content"
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Title/)
    expect(rendered).to match(/Content/)
  end
end
