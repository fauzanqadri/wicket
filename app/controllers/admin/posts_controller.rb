class Admin::PostsController < ApplicationController
  # load_and_authorize_resource
  # skip_load_resource :only => [:create]

  before_action :set_post, only: [:show, :edit, :update, :destroy]


  # GET /posts
  # GET /posts.json
  def index
    respond_to do |format|
      format.html
      format.json {render json: PostIndexDatatables.new(view_context)}
    end
  end

  # GET /posts/1
  # GET /posts/1.json
  def show
  end

  # GET /posts/new
  def new
    @post = Post.new
  end

  # GET /posts/1/edit
  def edit
  end

  # POST /posts
  # POST /posts.json
  def create
    @post = Post.new(post_params)
    respond_to do |format|
      if @post.save
        format.html {redirect_to admin_post_url(@post), notice: "Record post berhasil dibuat"}
      else
        format.html { render :new }
      end
    end
  end

  # PATCH/PUT /posts/1
  # PATCH/PUT /posts/1.json
  def update
    respond_to do |format|
      if @post.update(post_params)
        format.html {redirect_to admin_post_url(@post), notice: "Record post berhasil diupdate"}
      else
        format.html { render :edit }
      end
    end
  end

  # DELETE /posts/1
  # DELETE /posts/1.json
  def destroy
    @post.destroy
    respond_to do |format|
      format.html { redirect_to admin_posts_url, notice: 'Record post berhasil dihapus' }
      format.json { head :no_content }
    end
  end

  def change_status
    @post = Post.find(params[:id])
    respond_to do |format|
      if @post.update_status
        flash[:success] = "Status post berhasil diupdate"
        format.js
      else
        flash[:error] = "Ermmm, Something went wrong here"
        format.js
      end
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_post
      @post = Post.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def post_params
      params.require(:post).permit(:title, :content, :published, :tag_list)
    end
end
