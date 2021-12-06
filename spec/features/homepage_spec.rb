feature 'testing homepage' do
  scenario 'welcomes the user called jesica' do
    visit('/')
    expect(page).to have_content 'Bookmark Manager'
  end
end