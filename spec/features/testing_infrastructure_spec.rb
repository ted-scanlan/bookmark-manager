feature 'testing infrastructure' do
  scenario 'Can run app and check page content' do
    visit ('/')
    expect(page).to have_content 'Bookmark Manager'
  end
end
