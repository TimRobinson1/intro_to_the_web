require 'capybara'
require_relative './web_helpers.rb'

feature 'Feature test' do
  it 'has content on the page' do
    visit('/')
    expect(page).to have_content 'Player 1:'
  end

  it 'allows players to fill in and see their names' do
    sign_in_and_play
    expect(page).to have_content 'Player 1: Hero'
    expect(page).to have_content 'Player 2: Villain'
  end

  it 'displays player 2 hit points' do
    sign_in_and_play
    expect(page).to have_content 'Player 2: Villain, Hit Points: 100'
  end
end
