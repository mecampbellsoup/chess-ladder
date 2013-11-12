require 'spec_helper'

describe Player do

  let(:player)  { Player.new }
  let(:player2) { Player.new }

  before :each do
    player.ranking = 1
    player.save
    player2.ranking = 5
    player2.save
  end

  it "should have a method that swaps ranks" do
    subject.class.swap_rankings!(player, player2)
    expect(player.ranking).to eq(5)
    expect(player2.ranking).to eq(1)
  end

  it "should keep track of its wins and losses" do
    pending
  end
end
