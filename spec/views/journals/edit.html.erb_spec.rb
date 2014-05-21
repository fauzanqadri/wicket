require 'spec_helper'

describe "journals/edit" do
  before(:each) do
    @journal = assign(:journal, stub_model(Journal,
      :name => "MyString",
      :driver => "MyString"
    ))
  end

  it "renders the edit journal form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", journal_path(@journal), "post" do
      assert_select "input#journal_name[name=?]", "journal[name]"
      assert_select "input#journal_driver[name=?]", "journal[driver]"
    end
  end
end
