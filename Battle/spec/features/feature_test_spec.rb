require 'capybara'

feature 'Feature test' do
  it 'has content on the page' do
    visit('/')
    expect(page).to have_content 'Player 1:'
  end

  it 'allows players to fill in and see their names' do
    visit('/')
    within('form') do
      fill_in 'player1', with: 'Hero'
      fill_in 'player2', with: 'Villain'
    end
    click_button 'submit'
    expect(page).to have_content 'Player 1: Hero, Player 2: Villain'
  end
end
