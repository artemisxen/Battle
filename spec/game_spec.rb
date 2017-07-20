require 'game'

describe Game do

  subject(:game) { described_class.new(player_1, player_2)}
  let(:player_1) { double(:player, reduce_points: nil) }
  let(:player_2) { double(:player, reduce_points: nil) }

  describe "game accepts 2 players" do
    it "stores the players as instance variables" do
      expect(game.player_1).to eq player_1
    end
  end

  describe '#turn' do
    it "starts on player 1's turn by default" do
      expect(game.turn).to eq player_1
    end
  end

  describe "#attack" do
    it "calls reduce points method on the player" do
      expect(player_1).to receive(:reduce_points)
      game.attack(player_1)
    end

    it "switches whose turn it is" do
      game.attack(player_2)
      expect(game.turn).to eq player_2
    end
  end
end
