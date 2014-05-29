json.array! @journals do |journal|
  json.(journal, :id, :name, :url, :online_accounts_count, :host)
  json.status journal.status
end
