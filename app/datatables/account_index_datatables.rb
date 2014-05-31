class AccountIndexDatatables
  delegate :params, :link_to, :raw, :content_tag, to: :@view
  delegate :url_helpers, to: 'Rails.application.routes'

  def initialize view
    @view = view
  end

  def accounts
    @accounts ||= fetch_accounts
  end

  def as_json opt = {}
    {
      sEcho: params[:sEcho].to_i,
      iTotalRecords: Account.count,
      iTotalDisplayRecords: accounts.total_entries,
      aaData: data
    }
  end

  private

  def data
    accounts.map do |account|
      [
        wrap_text(account.full_name),
        wrap_text(account.username),
        wrap_text(account.email),
        wrap_text(account.created_at.to_formatted_s(:long_ordinal)),
        act(account)
      ]
    end
  end

  def wrap_text text
    content_tag :div, "#{text}", class: "text-center"
  end


  def act account
    action = []
    action << raw(link_to(content_tag(:i, "", class: "fa fa-edit"), url_helpers.edit_admin_account_path(account), class: "btn btn-xs btn-info", remote: true))
    action << raw(link_to(content_tag(:i, "", class: "fa fa-trash-o"), url_helpers.admin_account_path(account), class: "btn btn-xs btn-danger", method: :delete, data: {confirm: "Confirm deleting ?"}))
    content_tag :div, class: "text-center" do
      content_tag :div, class: "btn-group" do
        raw(action.join(""))
      end
    end
  end


  def fetch_accounts
    accounts = Account.order("#{sort_column} #{sort_direction}")
    accounts = accounts.page(page).per_page(per_page)
    if params[:sSearch].present?
      accounts = accounts.where("full_name like :search or username like :search or email like :search", search: "%#{params[:sSearch]}%")
    end
    accounts
  end

  def page
    params[:iDisplatStart].to_i/per_page + 1
  end

  def per_page
    params[:iDisplayLength].to_i > 0 ? params[:iDisplayLength].to_i : 10
  end

  def sort_column
    column = %w[full_name username email created_at]
    column[params[:iSortCol_0].to_i]
  end

  def sort_direction
    params[:sSortDir_0] == "desc" ? "desc" : "asc"
  end

end
