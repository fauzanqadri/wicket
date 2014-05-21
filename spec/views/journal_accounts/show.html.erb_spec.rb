require 'spec_helper'

describe "journal_accounts/show" do
  before(:each) do
    @journal_account = assign(:journal_account, stub_model(JournalAccount,
      :username => "Username",
      :password => "Password",
      :other => "Other",
      :journal_id => 1
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Username/)
    rendered.should match(/Password/)
    rendered.should match(/Other/)
    rendered.should match(/1/)
  end
end
