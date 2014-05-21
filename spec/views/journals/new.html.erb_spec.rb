require 'spec_helper'

describe "journals/new" do
  before(:each) do
    assign(:journal, stub_model(Journal,
      :name => "MyString",
      :driver => "MyString"
    ).as_new_record)
  end

  it "renders new journal form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", journals_path, "post" do
      assert_select "input#journal_name[name=?]", "journal[name]"
      assert_select "input#journal_driver[name=?]", "journal[driver]"
    end
  end
end
