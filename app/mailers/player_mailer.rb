class PlayerMailer < ActionMailer::Base
  default from: "matthew.campbell@flatironschool.com"

  def welcome_email(player)
    @player = player
    @url  = login_path
    mail(to: @player.email, subject: 'Welcome to the Flatiron ChessLadder!')
  end
  
end
