require 'database_helpers'


describe Bookmark do
  describe '.create' do
    it 'creates a bookmark' do

      bookmark = Bookmark.create(url: 'http://www.google.com', title: "Google")

      database_row = get_bookmark_row_from_db(id: bookmark.id)

      expect(database_row['title']).to eq 'Google'
      expect(database_row['url']).to eq 'http://www.google.com'

      expect(bookmark).to be_a Bookmark

      expect(bookmark.title).to eq 'Google'
      expect(bookmark.url).to eq 'http://www.google.com'

    end
  end

  describe '.all' do
    it 'returns users bookmarks' do

      # connection = PG.connect(dbname: 'bookmark_manager_test')

      ##add test data
      # connection.exec("INSERT INTO bookmarks (url) VALUES ('http://www.google.com');")
      # connection.exec("INSERT INTO bookmarks (url) VALUES ('http://www.bbc.co.uk');")
      # connection.exec("INSERT INTO bookmarks (url) VALUES ('http://www.makersacademy.com');")

      bookmark = Bookmark.create(url: 'http://www.google.com', title: "Google" )
      Bookmark.create(url: 'http://www.bbc.co.uk', title: "BBC" )
      Bookmark.create(url: 'http://www.makersacademy.co.uk', title: "Makers Academy" )


      bookmarks = Bookmark.all       #remember this test is specificlly testing the all class method

      expect(bookmarks.length).to eq 3

      expect(bookmarks.first).to be_a Bookmark
      expect(bookmarks.first.id).to eq bookmark.id
      expect(bookmarks.first.title).to eq "Google"
      expect(bookmarks.first.url).to eq "http://www.google.com"

    end

  end

  describe '.delete' do
    it 'deletes a bookmark' do
      bookmark = Bookmark.create(url: 'http://www.google.com', title: "Google")
      Bookmark.delete(id: bookmark.id)

      expect(Bookmark.all.length).to eq 0
  end
end

describe '.update' do
  it 'updates a bookmark' do
    bookmark = Bookmark.create(url: 'http://www.google.com', title: "Google")
    updated_bookmark = Bookmark.update(id: bookmark.id, url: "http://www.schmoogle.com", title: "Schmoogle")

    expect(updated_bookmark.id).to eq bookmark.id
    expect(updated_bookmark.title).to eq "Schmoogle"
    expect(updated_bookmark.url).to eq "http://www.schmoogle.com"
end
end

describe '.find' do
  it 'finds a bookmark' do
    bookmark = Bookmark.create(url: 'http://www.google.com', title: "Google")
    result = Bookmark.find(id: bookmark.id)

    expect(result.id).to eq bookmark.id
    expect(result.title).to eq "Google"
    expect(result.url).to eq "http://www.google.com"
  end
end
end
