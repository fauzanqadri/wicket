class PasswordsController < Devise::PasswordsController
  protected
  def after_sending_reset_password_instructions_path_for(resource_name)
    root_url
    #redirect_to root_url, notice: "We send instruction how to reset password to your email"
  end
end
