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
    expect(page).not_to have_content 'Villain was attacked!'
    find('#fight').click
    expect(page).to have_content 'Villain was attacked!'
  end

  it 'takes away health in an attack' do
    sign_in_and_play
    srand(5)
    find('#fight').click
    expect(page).to have_content 'Player 2: Villain, Hit Points: 90'
  end

  it 'allows players to exchange damage' do
    sign_in_and_play
    srand(18)
    find('#fight').click
    find('#fight').click
    expect(page).to have_content 'Player 1: Hero, Hit Points: 90'
  end

  it 'results in endgame message if a player dies' do
    sign_in_and_play
    srand(18)
    14.times do
      find('#fight').click
    end
    find('#fight').click
    expect(page).to have_content 'Villain DIED'
  end
end
