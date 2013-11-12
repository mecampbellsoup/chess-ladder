class Challenge < ActiveRecord::Base
  
  before_save :check_player_rankings

  belongs_to :winner, class_name: "Player"
  belongs_to :loser, class_name: "Player"

  private

  def check_player_rankings
    if winner.ranking > loser.ranking
      # larger ranking means lower on the ladder, duh
      Player.swap_rankings!(winner,loser)
    end
  end
end
