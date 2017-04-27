def sign_in_and_play
  visit('/')
  within('form') do
    fill_in 'player1', with: 'Hero'
    fill_in 'player2', with: 'Villain'
  end
  click_button 'FIGHT!'
end
