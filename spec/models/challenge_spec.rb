require 'spec_helper'

describe Challenge do

  let(:player)    { Player.new }
  let(:player2)   { Player.new }
  let(:challenge) { Challenge.new }

  before :each do
    player.update(:ranking => 1)
    player2.update(:ranking => 5)
    challenge.update(:winner => player2, :loser => player)
  end

  it "should have a winner and a loser" do
    expect(challenge.winner_id).to eq(player2.id)
    expect(challenge.loser_id).to eq(player.id)
  end

  context "a new game has been played and will be saved" do
    it "should swap rankings if the winner has a lower ranking than the loser" do
      expect(player.ranking).to eq(5)
      expect(player2.ranking).to eq(1)
    end

    it "should not swap rankings if the winner is ranked higher" do
      challenge.update(:winner => player, :loser => player2)
      expect(player.ranking).to eq(1)
      expect(player2.ranking).to eq(5)
    end
  end

  context "elo ranking" do 
    it "player 2's elo ranking rises when s/he wins" do 
      expect(player2.elo).to be > 1500
    end

    it "player 1's elo ranking falls when s/he wins" do 
      expect(player.elo).to be < 1500
    end
  end

end
