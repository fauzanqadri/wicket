class Post < ActiveRecord::Base
  acts_as_taggable
  validates_presence_of :title, :content
  default_scope {order("created_at desc")}

  def update_status
    status = self.published? ? false : true
    self.update(published: status)
  end

  def to_param
    "#{self.id}-#{self.title.parameterize}"
  end

  def tag_array
    self.tag_list.split(",")
  end
end
