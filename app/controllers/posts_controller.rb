class PostsController < ApplicationController
  respond_to :json

  def index
    @presenter = IndexPresenter.new(params)
    respond_with @presenter
  end

  def show
    @post = Post.find(params[:id])
  end
end
