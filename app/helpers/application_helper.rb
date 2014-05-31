module ApplicationHelper
  def full_title text
    return "Journalist | #{text}" if text.present?
    return "Journalist"
  end


  def flash_class level
    css_class = {'notice' => "alert alert-info", 'success' => "alert alert-success", 'error' => "alert alert-danger", 'alert' => "alert alert-danger"}
    css_class[level]
  end

  def flash_icon level
    css_class = {'notice' => "fa fa-rocket", 'success' => "fa fa-check", 'error' => "fa fa-times", 'alert' => "fa fa-times"}
    css_class[level]
  end

  def message_status level
    status = {'notice' => "Notice", 'success' => "Success", 'error' => "Error", 'alert' => "Alert"}
    status[level]
  end

  def role_select_helper
    Account::ROLE.map {|role| [role.downcase, role]}
  end

end
