feature 'viewing bookmarks' do
  scenario 'user can click view button' do
    visit '/'
    expect(page).to have_selector(:link_or_button, 'View bookmarks')
  end

  scenario 'user can view list of bookmarks' do
    visit '/'
    click_button 'View bookmarks'
    expect(page).to have_content "Bookmarks"
  end
end 
