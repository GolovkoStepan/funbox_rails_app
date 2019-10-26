class UpdateRateWorker
  include Sidekiq::Worker

  def perform(name, count)
    ParseRateService.new.update_rate
    rate = YamlService.new.get(:current_rate)
    ActionCable.server.broadcast("web_rate_update_channel", content: rate)
    UpdateRateWorker.perform_at(1.hour, "Update Rate", 1)
  end
end