require 'spec_helper'

describe "journal_accounts/edit" do
  before(:each) do
    @journal_account = assign(:journal_account, stub_model(JournalAccount,
      :username => "MyString",
      :password => "MyString",
      :other => "MyString",
      :journal_id => 1
    ))
  end

  it "renders the edit journal_account form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", journal_account_path(@journal_account), "post" do
      assert_select "input#journal_account_username[name=?]", "journal_account[username]"
      assert_select "input#journal_account_password[name=?]", "journal_account[password]"
      assert_select "input#journal_account_other[name=?]", "journal_account[other]"
      assert_select "input#journal_account_journal_id[name=?]", "journal_account[journal_id]"
    end
  end
end
