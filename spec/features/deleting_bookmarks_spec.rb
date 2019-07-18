feature 'deleting a bookmark' do
  scenario 'user can delete a bookmark' do

    bookmark = Bookmark.create(url: "http://www.google.com", title: "Google")
    visit('/')
    click_button 'View bookmarks'
    expect(page).to have_link('Google', href: 'http://www.google.com')

    first('.bookmark').click_button 'Delete'

    expect(current_path).to eq '/bookmarks'
    expect(page).not_to have_link('Google', href: 'http://www.google.com')

end
end
