class SessionsController < ApplicationController
  skip_before_action :login_required, :only => [:new, :create]

  def new
  end

  def create
    login(params[:email])

    redirect_to root_path
  end

  def destroy
    reset_session
    redirect_to login_path
  end

end
