require 'spec_helper'

describe Challenge do

  let(:player)    { Player.new }
  let(:player2)   { Player.new }
  let(:challenge) { Challenge.new }

  before :each do
    player.update(:email => "player@email.com", :password => "test", :password_confirmation => "test")
    player2.update(:email => "player2@email.com", :password => "test", :password_confirmation => "test")
    challenge.update(:winner => player2, :loser => player)
  end

  it "should not have the same Player as winner and loser" do
    challenge.update_attributes(:winner => player, :loser => player)
    expect(challenge).to be_invalid
    expect(challenge.save).to be_false
    expect(challenge.errors.full_messages.join).to include("The winner & loser cannot be the same")
  end

  it "should have a winner and a loser" do
    expect(challenge.winner_id).to eq(player2.id)
    expect(challenge.loser_id).to eq(player.id)
  end

  context "a new game has been played and will be saved" do
    it "should swap rankings if the winner has a lower ranking than the loser" do
      expect(player.ranking).to eq(2)
      expect(player2.ranking).to eq(1)
    end

    it "should not swap rankings if the winner is ranked higher" do
      challenge.update(:winner => player, :loser => player2)
      expect(player.ranking).to eq(1)
      expect(player2.ranking).to eq(2)
    end
  end

  context "ELO ranking attribute" do 
    it "player 2's ELO ranking rises when s/he wins" do 
      expect(player2.elo).to be > 1500
    end

    it "player 1's ELO ranking falls when s/he wins" do 
      expect(player.elo).to be < 1500
    end
  end

end
