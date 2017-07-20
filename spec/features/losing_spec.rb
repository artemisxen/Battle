feature 'losing screen shown when player loses all HP' do
  let(:nearly_dead) { Player::DEFAULT_HP / Player::DEFAULT_ATTACK - 1 }
  scenario "player 2 loses" do
    sign_in_and_play('Bob', 'John')
    nearly_dead.times do
      find("form[name='fighter_1']").click_button "Attack"
      find("form[name='fighter_2']").click_button "Attack"
    end
    find("form[name='fighter_1']").click_button "Attack"
    expect(page).to have_content("John, you lose!")
  end
end
