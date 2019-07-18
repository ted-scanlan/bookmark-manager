feature 'adding bookmarks' do
  scenario 'user can add a bookmark' do
    visit '/'
    fill_in 'url', with: 'http://www.youtube.com'
    fill_in 'title', with: 'Youtube'
    click_button 'Save'
    click_button 'View bookmarks'
    expect(page).to have_link("Youtube", href: 'http://www.youtube.com')

  end
end
