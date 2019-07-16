require 'bookmarks'


describe Bookmarks do
  describe '.all' do
    it 'returns all bookmarks' do
      connection = PG.connect(dbname: 'bookmark_manager_test')

      ##add test data
      connection.exec("INSERT INTO bookmarks (url) VALUES ('http://www.google.com');")
      connection.exec("INSERT INTO bookmarks (url) VALUES ('http://www.bbc.co.uk');")
      connection.exec("INSERT INTO bookmarks (url) VALUES ('http://www.makersacademy.com');")

      bookmarks = Bookmarks.all

      expect(bookmarks).to include("http://www.google.com")
      expect(bookmarks).to include("http://www.bbc.co.uk")
      expect(bookmarks).to include("http://www.makersacademy.com")
    end
  end
end
