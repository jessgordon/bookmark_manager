feature 'updating a bookmark' do
  scenario 'user can update a bookmark' do
    bookmark = Bookmark.add_bookmark(url: 'www.google.com', title: 'Google Search')

    visit('/bookmarks')

    expect(page).to have_link('Google Search', href: 'www.google.com')
    first('.bookmark').click_button('update')
    expect(current_path).to eq "/bookmarks/#{bookmark.id}/update"

    fill_in('url', with: 'www.askjeeves.com')
    fill_in('title', with: 'Ask Jeeves')
    click_button('Submit')

    expect(current_path).to eq "/bookmarks"
    expect(page).not_to have_link('Google Search', href: 'www.google.com')
    expect(page).to have_link('Ask Jeeves', href: 'www.askjeeves.com')
  end
end