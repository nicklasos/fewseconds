require 'spec_helper'

describe "issues/index" do
  before(:each) do
    assign(:issues, [
      stub_model(Issue,
        :user => nil,
        :image => "Image",
        :name => "Name",
        :instructions => "MyText"
      ),
      stub_model(Issue,
        :user => nil,
        :image => "Image",
        :name => "Name",
        :instructions => "MyText"
      )
    ])
  end

  it "renders a list of issues" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => nil.to_s, :count => 2
    assert_select "tr>td", :text => "Image".to_s, :count => 2
    assert_select "tr>td", :text => "Name".to_s, :count => 2
    assert_select "tr>td", :text => "MyText".to_s, :count => 2
  end
end
