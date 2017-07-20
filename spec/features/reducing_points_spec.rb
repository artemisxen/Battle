feature 'Reducing points after attack' do
  scenario "player_1 attacks player_2" do
    sign_in_and_play('Bob', 'John')
    find("form[name='fighter_1']").click_button "Attack"
    expect(page).to have_content("John: 50HP")
  end

  scenario "player_2 attacks player_1" do
    sign_in_and_play('Bob', 'John')
    find("form[name='fighter_2']").click_button "Attack"
    expect(page).to have_content("Bob: 50HP")
  end

end
