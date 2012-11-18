require 'spec_helper'

describe "issues/show" do
  before(:each) do
    @issue = assign(:issue, stub_model(Issue,
      :user => nil,
      :image => "Image",
      :name => "Name",
      :instructions => "MyText"
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(//)
    rendered.should match(/Image/)
    rendered.should match(/Name/)
    rendered.should match(/MyText/)
  end
end
