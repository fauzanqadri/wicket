# require 'journalist'

Journalist.configure do
  # this configurations is place where you want to put journalist log, if you not set this the log will placed to '/tmp/log/journalist.log'
  # set nil if you don't wanna the log
  config.log_path = "#{Rails.root}/log/journalist.log"

  # this configurations is place where you want to put journalist certificates
  # certificate is using to validates https connections so it's still valid when connect to https
  # if it's not set, journalist will using certificates that maybe no longer valid, so please create your own certificates
  # config.certificates = "path/to/certificate.pem"

  # this configurations is for your redis host, default is localhost
  # config.redis_host = "localhost"

  # this configurations is for your redis port, default is 6379
  # config.redis_port = 6379

  # this configurations is for your redis db, default is 0
  # config.redis_db = 0

  # if you using nix/nux sock path to connect your redis, uncomment this configuration, and comment redis_host, redis_port, redis_username, and redis_password configurations
  # config.redis_path = "path/to/redis.sock"

  # this configurations is for yout redis username
  # config.redis_username = "username"

  # this configurations is for your redis password
  # config.redis_password = "password"

  # this configurations is for set active record model that store journal account
  # use string to set the model, journalist will constantize it leter
  config.journal_account_klass = "JournalAccount"

  # this configurations is most important for journalist, so the driver can use many account
  # this counfiguation is model that have `belongs_to` relationship with journal account
  # this model should content `driver` field that content class name of journal driver
  # use string to set the model, and use downcase letter
  config.journal_account_klass_belongs_to = "journal"

  config.agent_proxy_address = "localhost"
  config.agent_proxy_port = 3001
  # config.agent_proxy_username = "proxy username"
  # config.agent_proxy_password = "proxy password"
end
