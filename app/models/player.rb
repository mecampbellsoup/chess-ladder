class Player < ActiveRecord::Base
  has_many :wins,   foreign_key: :winner_id, class_name: "Challenge"
  has_many :losses, foreign_key: :loser_id,  class_name: "Challenge"

  before_create :set_elo
  
  def self.swap_rankings!(p1, p2)
    top = p1.ranking
    bottom = p2.ranking
    p1.update(:ranking => bottom)
    p2.update(:ranking => top)
  end

  def get_elo
    self.elo ||= 1500
  end
  
  private
  def set_elo
    self.elo ||= 1500
  end

end
