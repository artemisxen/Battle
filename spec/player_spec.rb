require 'player'

describe 'Player' do
   subject(:bob) { Player.new("Bob") }
   let(:hp_after_first_attack) { Player::DEFAULT_HP - Player::DEFAULT_ATTACK }

  it "checks player's name" do
    expect(bob.name).to eq "Bob"
  end

  it "reduces player's points" do
    bob.reduce_points
    expect(bob.hp).to eq hp_after_first_attack
  end
end
