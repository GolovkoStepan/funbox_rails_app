class SiteController < ApplicationController

  def index
    @current_rate = YamlService.new.get(:current_rate)
  end

  def admin

  end

end
