feature 'losing screen shown when player loses all HP' do
  let(:nearly_dead) { 2 }

  scenario "player 2 loses" do
    sign_in_and_play('Bob', 'John')
    nearly_dead.times do
      srand(1)
      find("form[name='fighter_1']").click_button "Attack"
      srand(1)
      find("form[name='fighter_2']").click_button "Attack"
    end
    srand(1)
    find("form[name='fighter_1']").click_button "Attack"
    expect(page).to have_content("John, you lose!")
  end
end
