class Api::AccountController < ApiController
  
  def index
    @account = current_account
    respond_with @account
  end
end
