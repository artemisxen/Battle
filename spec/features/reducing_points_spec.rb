feature 'Reducing points after attack' do
  srand(1)
  let(:hp_after_first_attack_1) { Player::DEFAULT_HP - 12 }
  let(:hp_after_first_attack_2) { Player::DEFAULT_HP - 8 }
  scenario "player_1 attacks player_2" do
    sign_in_and_play('Bob', 'John')
    find("form[name='fighter_1']").click_button "Attack"
    expect(page).to have_content("John: #{hp_after_first_attack_1}HP")
  end
  scenario "player_2 attacks player_1" do
    sign_in_and_play('Bob', 'John')
    find("form[name='fighter_2']").click_button "Attack"
    expect(page).to have_content("Bob: #{hp_after_first_attack_2}HP")
  end

end
