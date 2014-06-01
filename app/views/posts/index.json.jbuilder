json.total_records @presenter.total_records
json.total_display_records @presenter.total_display_records
json.page @presenter.page
json.posts do
  json.array! @presenter.posts do |post|
    json.(post, :id, :title, :created_at, :tag_list)
    json.content truncate_html(post.content, length: 150, omission: '...(continued)')
    json.post_url url_for(post)
  end
end
