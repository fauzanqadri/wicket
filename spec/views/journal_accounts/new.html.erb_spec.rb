require 'spec_helper'

describe "journal_accounts/new" do
  before(:each) do
    assign(:journal_account, stub_model(JournalAccount,
      :username => "MyString",
      :password => "MyString",
      :other => "MyString",
      :journal_id => 1
    ).as_new_record)
  end

  it "renders new journal_account form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", journal_accounts_path, "post" do
      assert_select "input#journal_account_username[name=?]", "journal_account[username]"
      assert_select "input#journal_account_password[name=?]", "journal_account[password]"
      assert_select "input#journal_account_other[name=?]", "journal_account[other]"
      assert_select "input#journal_account_journal_id[name=?]", "journal_account[journal_id]"
    end
  end
end
