class Player < ActiveRecord::Base
  has_many :wins, foreign_key: :winner_id, class_name: "Challenge"
  has_many :losses, foreign_key: :loser_id, class_name: "Challenge"
  
  def self.swap_rankings!(p1, p2)
    top = p1.ranking
    bottom = p2.ranking
    p1.update(:ranking => bottom)
    p2.update(:ranking => top)
  end

end
