class PostIndexDatatables
  delegate :params, :link_to, :raw, :content_tag, to: :@view
  delegate :url_helpers, to: 'Rails.application.routes'

  def initialize view
    @view = view
  end

  def posts
    @posts ||= fetch_posts
  end

  def as_json opt = {}
    {
      sEcho: params[:sEcho].to_i,
      iTotalRecords: Post.count,
      iTotalDisplayRecords: posts.total_entries,
      aaData: data
    }
  end

  private

  def data
    posts.map do |post|
      [
        wrap_text(post.title),
        wrap_text(post.created_at.to_formatted_s(:long_ordinal)),
        publish_post(post),
        act(post)
      ]
    end
  end

  def wrap_text text
    content_tag :div, "#{text}", class: "text-center"
  end

  def publish_post post
    change_status_post_url = if post.published?
                         link_to(content_tag(:i, "", class: "fa fa-check"), url_helpers.unpublish_admin_post_path(post), class: "btn btn-xs btn-success", remote: true, method: :post)
                       else
                         link_to(content_tag(:i, "", class: "fa fa-times"), url_helpers.publish_admin_post_path(post), class: "btn btn-xs btn-danger", remote: true, method: :post)
                       end
    content_tag :div, class: "text-center" do
      raw(change_status_post_url)
    end
  end

  def act post
    action = []
    action << raw(link_to(content_tag(:i, "", class: "fa fa-eye"), url_helpers.admin_post_path(post), class: "btn btn-xs btn-primary"))
    action << raw(link_to(content_tag(:i, "", class: "fa fa-edit"), url_helpers.edit_admin_post_path(post), class: "btn btn-xs btn-info"))
    action << raw(link_to(content_tag(:i, "", class: "fa fa-trash-o"), url_helpers.admin_post_path(post), class: "btn btn-xs btn-danger", method: :delete, data: {confirm: "Confirm deleting ?"}))
    content_tag :div, class: "text-center" do
      content_tag :div, class: "btn-group" do
        raw(action.join(""))
      end
    end
  end


  def fetch_posts
    posts = Post.order("#{sort_column} #{sort_direction}")
    posts = posts.page(page).per_page(per_page)
    if params[:sSearch].present?
      posts = posts.where("title like :search", search: "%#{params[:sSearch]}%")
    end
    posts
  end

  def page
    params[:iDisplayStart].to_i/per_page + 1
  end

  def per_page
    params[:iDisplayLength].to_i > 0 ? params[:iDisplayLength].to_i : 10
  end

  def sort_column
    column = %w[title created_at]
    column[params[:iSortCol_0].to_i]
  end

  def sort_direction
    params[:sSortDir_0] == "desc" ? "desc" : "asc"
  end
end

