feature 'bookmarks page' do
  scenario 'viewing bookmarks' do
    visit('/bookmarks')
    expect(page).to have_content('www.google.com')
    expect(page).to have_content('www.yahoo.com')
  end
end