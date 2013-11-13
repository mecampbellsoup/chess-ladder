class Player < ActiveRecord::Base
  has_many :wins,   foreign_key: :winner_id, class_name: "Challenge"
  has_many :losses, foreign_key: :loser_id,  class_name: "Challenge"

  before_create :elo
  
  def self.swap_rankings!(p1, p2)
    top = p1.ranking
    bottom = p2.ranking
    p1.update(:ranking => bottom)
    p2.update(:ranking => top)
  end

  # player#elo is called on before_create, but
  # needs necessary logic such that players created
  # before the database the introduction of ELO ratings
  # have an ELO ranking by default
  def elo
    self.read_attribute(:elo) || self.elo = 1500
  end

end
