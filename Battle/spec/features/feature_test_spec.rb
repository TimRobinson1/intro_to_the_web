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

  it 'confirms attacks' do
    sign_in_and_play
    expect(page).not_to have_content 'Hero attacked Villain!'
    find('#attack').click
    expect(page).to have_content 'Hero attacked Villain!'
  end

  it 'takes away 10 health in one attack' do
    sign_in_and_play
    find('#attack').click
    expect(page).to have_content 'Player 2: Villain, Hit Points: 90'
  end

  it 'presents button to change turns' do
    sign_in_and_play
    find('#attack').click
    within('form') { expect(page).to have_content 'Change Turns'}
  end

  it 'allows players to exchange damage' do
    sign_in_and_play
    find('#attack').click
    find_button('Change Turns').click
    find('#attack').click
    find_button('Change Turns').click
    expect(page).to have_content 'Player 1: Hero, Hit Points: 90'
  end
end
