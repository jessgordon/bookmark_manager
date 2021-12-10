feature 'Validates bookmarks' do
  scenario 'it throws flash message when user inputs invalid url' do
    visit('/bookmarks')
    fill_in('url', with: 'www.jessisfunny.com')
    fill_in('title', with: 'wrong website')
    click_on('Submit')
    expect(page).to have_content('Invalid url')
  end
end