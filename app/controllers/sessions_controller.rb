class SessionsController < ApplicationController
  skip_before_action :login_required, :only => [:new, :create]

  def new
  end

  def create
    player = Player.find_by(:email => params[:email])
    if player && player.authenticate(params[:password])
      login(player.id)
      redirect_to(root_path, :notice => "Successfully logged in!")
    else
      flash[:error] = "Something went wrong - try again please"
      render :new
    end
  end

  def destroy
    reset_session
    redirect_to login_path
  end

end
