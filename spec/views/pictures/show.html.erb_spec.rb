require 'rails_helper'

RSpec.describe "pictures/show", :type => :view do
  before(:each) do
    @picture = assign(:picture, Picture.create!(
      :key => "Key",
      :value => "Value"
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Key/)
    expect(rendered).to match(/Value/)
  end
end
