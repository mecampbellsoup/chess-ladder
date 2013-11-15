class Challenge < ActiveRecord::Base
  validate :winner_and_loser_cannot_be_equal
  
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
    w = Elo::Player.new(:rating => winner.elo, :games_played => winner.games_played)
    l = Elo::Player.new(:rating => loser.elo, :games_played => loser.games_played)
    w.wins_from(l)

    winner.elo = w.rating
    winner.save
    loser.elo = l.rating
    loser.save
  end

  private
    def winner_and_loser_cannot_be_equal
      @errors.add(:base, "The winner & loser cannot be the same player!") if self.winner === self.loser
    end
end
