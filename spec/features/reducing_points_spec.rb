feature 'Reducing points after attack' do

  let(:hp_after_first_attack) { Player::DEFAULT_HP - Player::DEFAULT_ATTACK }
  scenario "player_1 attacks player_2" do
    sign_in_and_play('Bob', 'John')
    find("form[name='fighter_1']").click_button "Attack"
    expect(page).to have_content("John: #{hp_after_first_attack}HP")
  end

  scenario "player_2 attacks player_1" do
    sign_in_and_play('Bob', 'John')
    find("form[name='fighter_2']").click_button "Attack"
    expect(page).to have_content("Bob: #{hp_after_first_attack}HP")
  end

end
