feature 'adds bookmarks' do
  scenario 'A user can add a bookmark to Bookmark Manager' do
    visit('/bookmarks')
    fill_in('url', :with => 'www.google.com')
    fill_in('title', :with => 'Google Search')
    click_on('Submit')

    expect(page).to have_link('Google Search', href: 'www.google.com')
  end
end