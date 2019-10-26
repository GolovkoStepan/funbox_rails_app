Sidekiq.configure_server do |config|
  config.redis = { url: 'redis://localhost:6379/funbox_rails_app_workers' }
end

Sidekiq.configure_client do |config|
  config.redis = { url: 'redis://localhost:6379/funbox_rails_app_workers' }
end