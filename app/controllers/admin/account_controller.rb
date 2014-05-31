class Admin::AccountController < ApplicationController
  load_and_authorize_resource
  skip_load_resource :only => [:create]
  before_action :set_account, only: [:edit, :update, :destroy]
  before_action :remove_unused_params, only: :update

  def index
    respond_to do |format|
      format.html
      format.json {render json: AccountIndexDatatables.new(view_context)}
    end
  end

  def edit
    respond_to do |format|
      format.js
    end
  end

  def new
    @account = Account.new
    respond_to do |format|
      format.js
    end
  end

  def update
    respond_to do |format|
      if @account.update(account_params)
        flash[:notice] = "Record account berhasil diupdate"
        format.js
      else
        format.js {render :edit}
      end
    end
  end

  def create
    @account = Account.new(account_params)
    authorize! :create, @account
    respond_to do |format|
      if @account.save
        flash[:notice] = "Record account berhasil dibuat"
        format.js
      else
        format.js {render :new}
      end
    end
  end

  def destroy
    @account.destroy
    respond_to do |format|
      format.html {redirect_to account_index_url, notice: "Record account berhasil dihapus"}
      format.json{ head :no_content }
    end
  end

  private
  def set_account
    @account ||= Account.find(params[:id])
  end

  def remove_unused_params
    params[:account].delete(:password) if params[:account][:password].blank?
    params[:account].delete(:password_confirmation) if params[:account][:password_confirmation].blank?
  end

  def account_params
    params.require(:account).permit(:full_name, :role, :username, :email, :password, :password_confirmation)
  end

end
