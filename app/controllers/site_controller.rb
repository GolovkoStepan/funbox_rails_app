class SiteController < ApplicationController

  before_action :create_yaml_service

  def index
    if @yaml_service.get(:is_force)
      @current_rate = @yaml_service.get(:force_rate)
    else
      @current_rate = @yaml_service.get(:current_rate)
    end
  end

  def admin
    @force_rate = @yaml_service.get(:force_rate)
    @force_end_datetime = @yaml_service.get(:force_end_datetime)
    @is_force = @yaml_service.get(:is_force)
  end

  def force_rate
    @yaml_service.put(:force_rate, params[:force_rate])
    @yaml_service.put(:force_end_datetime, params[:force_end_datetime])
    @yaml_service.put(:is_force, true)

    force_end_datetime = DateTime.parse("#{params[:force_end_datetime]}#{Time.zone.now.formatted_offset}")
    ActionCable.server.broadcast("web_rate_update_channel", content: params[:force_rate])
    ForceEndWorker.perform_at(force_end_datetime, "End force rate", 1)

    redirect_to admin_path
  end

  private

  def create_yaml_service
    @yaml_service = YamlService.new
  end

end
