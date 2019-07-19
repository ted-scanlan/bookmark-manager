feature 'validating url' do
  scenario 'validates url for user' do
    visit '/'
    fill_in 'url', with: 'eggs'
    fill_in 'title', with: 'eggs'
    click_button 'Save'
    expect(page).to have_content "Error: invalid url"

end 
end
