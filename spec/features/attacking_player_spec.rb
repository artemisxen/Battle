feature 'Attacking' do
  scenario 'Attack Player 2' do
    sign_in_and_play('Bob', 'John')
    find("form[name='fighter_1']").click_button "Attack"
    expect(page).to have_content("Bob attacked John")
  end

  scenario 'Attack Player 1' do
    sign_in_and_play('Bob', 'John')
    find("form[name='fighter_2']").click_button "Attack"
    expect(page).to have_content("John attacked Bob")
  end
end
