class ApiController < ActionController::Base
  protect_from_forgery with: :exception
  include Api::AuthorizationHelper
  before_action :authorize_account!
  respond_to :json

  rescue_from ActionController::UnknownFormat do
    render json: {msg: "format not yet supported"}.to_json, status: 501
  end
end
