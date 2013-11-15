class Player < ActiveRecord::Base
  has_many :wins,   foreign_key: :winner_id, class_name: "Challenge"
  has_many :losses, foreign_key: :loser_id,  class_name: "Challenge"

  has_secure_password
  
  before_create :elo, :assign_ranking
  
  def self.swap_rankings!(p1, p2)
    top = p1.ranking
    bottom = p2.ranking
    p1.update(:ranking => bottom)
    p2.update(:ranking => top)
  end

  def games_played
    self.wins.count + self.losses.count
  end
  
  # player#elo is called on before_create, but
  # needs necessary logic such that players created
  # before the database the introduction of ELO ratings
  # have an ELO ranking by default
  def elo
    self.read_attribute(:elo) || self.elo = 1500
  end

  def assign_ranking
    self.ranking = Player.maximum(:ranking) ? Player.maximum(:ranking) + 1 : 1
  end


end
