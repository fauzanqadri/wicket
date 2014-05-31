class Admin::JournalAccountsController < ApplicationController
  load_and_authorize_resource
  skip_load_resource only: :create
  before_action :set_journal
  before_action :set_journal_account, only: [:show, :edit, :update, :destroy]

  def set_journal
    @journal ||= Journal.find(params[:journal_id])
  end

  def set_journal_account
    @journal_account ||= @journal.journal_accounts.find(params[:id])
  end

  # GET /journal_accounts
  # GET /journal_accounts.json
  def index
    respond_to do |format|
      format.html
      format.json {render json: JournalAccountsIndexDatatables.new(view_context)}
    end
  end

 # GET /journal_accounts/new
  def new
    @journal_account = @journal.journal_accounts.build
    respond_to do |format|
      format.js
    end
  end

  # GET /journal_accounts/1/edit
  def edit
    respond_to do |format|
      format.js
    end
  end

  # POST /journal_accounts
  # POST /journal_accounts.json
  def create
    @journal_account = @journal.journal_accounts.build(journal_account_params)
    authorize! :create, @journal_account
    respond_to do |format|
      if @journal_account.save
        flash[:notice] = "Record journal account berhasil dibuat"
        format.js
      else
        format.js {render :new}
      end
    end
  end

  # PATCH/PUT /journal_accounts/1
  # PATCH/PUT /journal_accounts/1.json
  def update
    respond_to do |format|
      if @journal_account.update(journal_account_params)
        flash[:notice] = "Record journal account berhasil diubah"
        format.js
      else
        format.js { render :edit }
      end
    end
  end

  # DELETE /journal_accounts/1
  # DELETE /journal_accounts/1.json
  def destroy
    @journal_account.destroy
    respond_to do |format|
      format.html { redirect_to journal_journal_accounts_url(@journal), notice: 'Record journal account berhasil di hapus' }
      format.json { head :no_content }
    end
  end

  def set_status
    @journal = Journal.find(params[:journal_id])
    @journal_account = @journal.journal_accounts.find(params[:journal_account_id])
    @journal_account.toggle_enable
    respond_to do |format|
      format.js
    end
  end

  private
    # Never trust parameters from the scary internet, only allow the white list through.
    def journal_account_params
      params.require(:journal_account).permit(:username, :password, :other)
    end
end
