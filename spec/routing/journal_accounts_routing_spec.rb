require "spec_helper"

describe JournalAccountsController do
  describe "routing" do

    it "routes to #index" do
      get("/journal_accounts").should route_to("journal_accounts#index")
    end

    it "routes to #new" do
      get("/journal_accounts/new").should route_to("journal_accounts#new")
    end

    it "routes to #show" do
      get("/journal_accounts/1").should route_to("journal_accounts#show", :id => "1")
    end

    it "routes to #edit" do
      get("/journal_accounts/1/edit").should route_to("journal_accounts#edit", :id => "1")
    end

    it "routes to #create" do
      post("/journal_accounts").should route_to("journal_accounts#create")
    end

    it "routes to #update" do
      put("/journal_accounts/1").should route_to("journal_accounts#update", :id => "1")
    end

    it "routes to #destroy" do
      delete("/journal_accounts/1").should route_to("journal_accounts#destroy", :id => "1")
    end

  end
end
