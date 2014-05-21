require 'spec_helper'

describe "journals/index" do
  before(:each) do
    assign(:journals, [
      stub_model(Journal,
        :name => "Name",
        :driver => "Driver"
      ),
      stub_model(Journal,
        :name => "Name",
        :driver => "Driver"
      )
    ])
  end

  it "renders a list of journals" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Name".to_s, :count => 2
    assert_select "tr>td", :text => "Driver".to_s, :count => 2
  end
end
