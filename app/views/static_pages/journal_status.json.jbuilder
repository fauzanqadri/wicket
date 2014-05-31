json.array! @journals do |journal|
  json.(journal, :id, :name, :journal_accounts_count, :online_accounts_count, :offline_accounts_count, :created_at)
  json.status journal.status
  json.colors journal.online_accounts_count == 0 ? "label label-danger" : "label label-success"
end
