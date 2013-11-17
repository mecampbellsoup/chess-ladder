class TimerController < ApplicationController
  skip_before_action :login_required, :only => [:new]
  before_action :set_current_url

  def new
  end

  private

    def set_current_url
      @current_path = request.path
    end
  
end
