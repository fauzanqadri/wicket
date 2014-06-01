class PostsController::IndexPresenter

  def initialize params
    @params ||= params
  end

  def posts
    @posts ||= fetch_posts
  end

  def total_records
    Post.count
  end

  def total_display_records
    posts.total_entries
  end

  def page
    @params[:display_start].to_i/per_page + 1
  end

  private
  def fetch_posts
    posts = Post.order("#{order_by} #{order_direction}")
    posts = posts.page(page).per_page(per_page)
    if @params[:search].present?
      posts = posts.where("title like :search", search: "%#{@params[:search]}%")
    end
    posts
  end

  def per_page
    @params[:display_length].to_i > 0 ? @params[:display_length].to_i : 10
  end

  def order_direction
    @params[:order_direction] == "asc" ? "asc" : "desc"
  end

  def order_by
    @params[:order_by].present? ? @params[:order_by] : 'created_at'
  end
end
