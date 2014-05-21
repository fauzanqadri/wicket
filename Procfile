web: bundle exec unicorn -E $RAILS_ENV -c config/unicorn.rb & tail -f log/development.log
proxy: bundle exec bin/proxy
sidekiq: bundle exec sidekiq -C config/sidekiq.yml
