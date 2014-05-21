require 'spec_helper'

describe "journal_accounts/index" do
  before(:each) do
    assign(:journal_accounts, [
      stub_model(JournalAccount,
        :username => "Username",
        :password => "Password",
        :other => "Other",
        :journal_id => 1
      ),
      stub_model(JournalAccount,
        :username => "Username",
        :password => "Password",
        :other => "Other",
        :journal_id => 1
      )
    ])
  end

  it "renders a list of journal_accounts" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Username".to_s, :count => 2
    assert_select "tr>td", :text => "Password".to_s, :count => 2
    assert_select "tr>td", :text => "Other".to_s, :count => 2
    assert_select "tr>td", :text => 1.to_s, :count => 2
  end
end
