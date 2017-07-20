require 'game'

describe Game do

  subject(:game) { described_class.new }
  let(:player) { double('player') }

  describe "#attack" do
    it "calls reduce points method on the player" do
      expect(player).to receive(:reduce_points)
      game.attack(player)
    end
  end
end
