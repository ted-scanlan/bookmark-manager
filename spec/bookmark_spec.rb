require 'bookmarks'

describe Bookmarks do
  describe '.all' do
    it 'returns all bookmarks' do
      bookmarks = Bookmarks.all

      expect(bookmarks).to include("http://www.google.com")
      expect(bookmarks).to include("http://www.bbc.com")
      expect(bookmarks).to include("http://www.makersacademy.com")
    end
  end
end
