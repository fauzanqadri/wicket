class StaticPagesController < ApplicationController
  skip_authorization_check
  def index
  end

  def journal_status
    @journals = Journal.all
    respond_to do |format|
      format.json
    end
  end

  def sign_in_status
    respond_to do |format|
      format.json
    end
  end
end
