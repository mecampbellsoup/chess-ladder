require 'spec_helper'

describe Challenge do

  let(:player)    { Player.new }
  let(:player2)   { Player.new }
  let(:challenge) { Challenge.new }

  before :each do
    player.update(:ranking => 1)
    player2.update(:ranking => 5)
  end

  it "should have a winner and a loser" do
    challenge.winner = player
    challenge.loser = player2
    expect(challenge.winner_id).to eq(player.id)
    expect(challenge.loser_id).to eq(player2.id)
  end
end
