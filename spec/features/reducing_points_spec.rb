feature 'Reducing points after attack' do
  scenario "reduce the player's points" do
    sign_in_and_play('Bob', 'John')
    click_button "Attack"
    expect(page).to have_content("50HP")
  end
end
