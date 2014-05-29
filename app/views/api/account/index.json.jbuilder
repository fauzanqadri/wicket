json.(@account, :id, :email, :full_name)
json.role @account.role.humanize
json.avatar @account.avatar
