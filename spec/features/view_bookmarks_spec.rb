feature 'bookmarks page' do
  scenario 'user can view bookmarks' do
    Bookmark.add_bookmark(url: 'http://www.google.com/', title: 'Google Search')
    Bookmark.add_bookmark(url: 'http://www.makersacademy.com/', title: 'Makers Academy')
    Bookmark.add_bookmark(url: 'http://www.destroyallsoftware.com', title: 'Destroy All Software')

    visit('/bookmarks')
    
    expect(page).to have_link('Google Search', href: 'http://www.google.com/')
    expect(page).to have_link('Makers Academy', href: 'http://www.makersacademy.com/')
    expect(page).to have_link('Destroy All Software', href: 'http://www.destroyallsoftware.com')
  end
end