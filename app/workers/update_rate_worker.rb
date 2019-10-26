class UpdateRateWorker
  include Sidekiq::Worker

  def perform(name, count)
    ParseRateService.new.update_rate
    UpdateRateWorker.perform_at(1.hour, "Update Rate", 1)
  end
end