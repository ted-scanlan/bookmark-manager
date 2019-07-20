feature 'comment on a bookmark' do
  scenario 'it enables a user to comment on a bookmark' do
    bookmark = Bookmark.create(url: "http://www.google.com", title: "Google")
    visit '/bookmarks'
    click_button 'comment'
    fill_in 'text', with: "this is a comment!"
    click_button 'Submit'
    expect(page).to have_content "this is a comment!"


  end
end
