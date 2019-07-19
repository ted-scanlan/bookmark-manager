feature 'updating a bookmark' do
  scenario 'it enables a user to update a bookmark' do
    bookmark = Bookmark.create(url: "http://www.google.com", title: "Google")
    visit('/')
    click_button 'View bookmarks'

    first('.bookmark').click_button 'Edit'

    expect(current_path).to eq "/bookmarks/#{bookmark.id}/edit"

    fill_in 'title', with: 'Schmoogle'
    fill_in 'url', with: 'http://www.schmoogle.com'
    click_button('Save')

    expect(current_path).to eq "/bookmarks" 

    expect(page).not_to have_link('Google', href: 'http://www.google.com')
    expect(page).to have_link('Schmoogle', href: 'http://www.schmoogle.com')
  end
end
