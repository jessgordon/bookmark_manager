feature 'deletes a bookmark' do
    scenario 'a user can delete a bookmark'do
        Bookmark.add_bookmark(url: 'www.google.com', title: 'Google search')
        visit('/bookmarks')
        expect(page).to have_link('Google search', href: 'www.google.com')
        first('.bookmark').click_button('delete')
        expect(current_path).to eq '/bookmarks'
        expect(page).not_to have_link('Google search', href: 'www.google.com')
    end
end