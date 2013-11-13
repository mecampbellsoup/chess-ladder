class Challenge < ActiveRecord::Base
  
  before_save :check_player_rankings, :change_elo_rankings

  belongs_to :winner, class_name: "Player"
  belongs_to :loser, class_name: "Player"

  private

  def check_player_rankings
    if winner.ranking > loser.ranking
      # larger ranking means lower on the ladder, duh
      Player.swap_rankings!(winner,loser)
    end
  end

  def change_elo_rankings
    w = Elo::Player.new(:rating => winner.elo)
    l = Elo::Player.new(:rating => loser.elo)
    w.wins_from(l)

    winner.elo = w.rating
    winner.save
    loser.elo = l.rating
    loser.save
  end
end
