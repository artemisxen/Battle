feature 'Attacking' do
  scenario 'Attack Player 2' do
    sign_in_and_play('Bob', 'John')
    click_button "Attack"
    expect(page).to have_content("Bob attacked John")
  end
end
