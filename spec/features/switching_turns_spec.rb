feature "Switching turns" do
  before { sign_in_and_play('Bob', 'John') }

  scenario "game begins on player 1's turn" do
    expect(page).to have_content("Bob's turn!")
  end

  scenario "First attack has been made" do
    click_button "Attack"
    expect(page).to have_content("John's turn!")
  end
end
