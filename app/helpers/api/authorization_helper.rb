module Api::AuthorizationHelper
  def headers
    request.headers
  end

  def current_account= account
    @current_account = account
  end

  def current_account
    api_authorization = headers["X-Api-Key"]
    @current_account ||= Account.find_by_api_key(api_authorization)
  end

  def authorized?
    !current_account.nil?
  end

  def authorize_account!
    unless authorized?
      render json: {msg: "Not Authorize"}.to_json, status: :unauthorized
    end
  end

end
