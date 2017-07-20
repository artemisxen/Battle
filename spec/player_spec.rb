require 'player'

describe 'Player' do
   subject(:bob) { Player.new("Bob") }

  it "checks player's name" do
    expect(bob.name).to eq "Bob"
  end

  it "reduces player's points" do
    bob.reduce_points
    expect(bob.hp).to eq Player::DEFAULT_HP - 10 
  end
end
