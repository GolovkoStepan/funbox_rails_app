# frozen_string_literal: true

class ForceEndWorker
  include Sidekiq::Worker

  def perform(_name, _count)
    yaml_service = YamlService.new

    yaml_service.put(:is_force, false)
    rate = yaml_service.get(:current_rate)

    ActionCable.server.broadcast('web_rate_update_channel', content: rate)
  end
end
