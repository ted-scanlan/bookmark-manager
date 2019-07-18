require 'pg'

feature 'viewing bookmarks' do
  scenario 'user can click view button' do
    visit '/'
    expect(page).to have_selector(:link_or_button, 'View bookmarks')
  end

  scenario 'user can see bookmark and title' do
    connection = PG.connect(dbname: "bookmark_manager_test")
    Bookmark.create(url: 'http://www.google.com', title: "Google")
    Bookmark.create(url: 'http://www.bbc.co.uk', title: "BBC")
    Bookmark.create(url: 'http://www.makersacademy.com', title: "Makers Academy")
#
#     # connection.exec("INSERT INTO bookmarks (url) VALUES('http://www.bbc.co.uk');")
#     # connection.exec("INSERT INTO bookmarks (url) VALUES('http://www.makersacademy.com');")
#


    visit '/'
    click_button 'View bookmarks'
    expect(page).to have_link("Google", href: "http://www.google.com")
    expect(page).to have_link("BBC", href: "http://www.bbc.co.uk")
    expect(page).to have_link("Makers Academy", href: "http://www.makersacademy.com")

    # expect(page).to have_content "http://www.makersacademy.com"
  end
end
