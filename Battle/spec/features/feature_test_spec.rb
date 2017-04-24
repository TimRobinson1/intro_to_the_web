require 'capybara'

feature 'Feature test' do
  it 'has content on the page' do
    visit('/')
    expect(page).to have_content 'Testing Infrastructure Working!'
  end
end
