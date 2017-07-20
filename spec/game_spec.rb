require 'game'

describe Game do

  subject(:game) { described_class.new(player_1, player_2)}
  let(:player_1) { double('player') }
  let(:player_2) { double('player') }

  describe "game accepts 2 players" do
    it "stores the players as instance variables" do
      expect(game.player_1).to eq player_1
    end

  end

  describe "#attack" do
    it "calls reduce points method on the player" do
      expect(player_1).to receive(:reduce_points)
      game.attack(player_1)
    end
  end
end
