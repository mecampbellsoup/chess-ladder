require 'spec_helper'

describe Player do

  let(:player)  { Player.new }
  let(:player2) { Player.new }
  let(:challenge) { Challenge.new }

  before :each do
    player.ranking = 1
    player.save
    player2.ranking = 2
    player2.save
  end

  it "should have a method that swaps ranks" do
    subject.class.swap_rankings!(player, player2)
    expect(player.ranking).to eq(2)
    expect(player2.ranking).to eq(1)
  end

  it "should keep track of its wins and losses" do
    challenge.winner = player2
    challenge.loser = player
    challenge.save
    expect(player2.wins).to include(challenge)
    expect(player.losses).to include(challenge)
  end

  it "knows how many games it has played" do 
    challenge.update(:winner => player, :loser => player2)
    expect(player.games_played).to eq(1)
  end

  it "has a default elo ranking of 1500 from before_create hook" do 
    expect(player.elo).to eq(1500)
  end

  it "returns its elo ranking" do 
    player.elo = 2000
    player.save
    expect(player.elo).to eq(2000)
  end

  it "has a rating of 1500 if it was created before ELO implementation" do 
    player.elo = nil # approximation, to get around before_create hook
    expect(player.elo).to eq(1500)
  end

  it "is created with the lowest ranking" do
    player3 = Player.create
    expect(player3.ranking).to eq(3)
  end

end
