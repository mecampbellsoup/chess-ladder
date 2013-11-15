class TimerController < ApplicationController
  skip_before_action :login_required, :only => [:new]

  def new
  end
  
end
