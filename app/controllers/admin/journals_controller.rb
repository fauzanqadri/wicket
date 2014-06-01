class Admin::JournalsController < ApplicationController
  load_and_authorize_resource
  skip_load_resource :only => [:create]
  before_action :set_journal, only: [:show, :edit, :update, :destroy]

  # GET /journals
  # GET /journals.json
  def index
    respond_to do |format|
      format.html
      format.json {render json: JournalIndexDatatables.new(view_context)}
    end
    # @journals = Journal.all
  end

  # GET /journals/new
  def new
    @journal = Journal.new
    respond_to do |format|
      format.js
    end
  end

  # GET /journals/1/edit
  def edit
    respond_to do |format|
      format.js
    end
  end

  # POST /journals
  # POST /journals.json
  def create
    @journal = Journal.new(journal_params)
    authorize! :create, @journal
    respond_to do |format|
      if @journal.save
        flash[:notice] = "Record journal berhasil dibuat"
        format.js
      else
        format.js {render :new}
      end
    end
  end

  # PATCH/PUT /journals/1
  # PATCH/PUT /journals/1.json
  def update
    respond_to do |format|
      if @journal.update(journal_params)
        flash[:notice] = "Record journal berhasil diupdate"
        format.js
      else
        format.js {render :edit}
      end
    end
  end

  # DELETE /journals/1
  # DELETE /journals/1.json
  def destroy
    @journal.destroy
    respond_to do |format|
      format.html { redirect_to admin_journals_url, notice: 'Record journal berhasil dihapus' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_journal
      @journal = Journal.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def journal_params
      params.require(:journal).permit(:name, :driver)
    end
end
