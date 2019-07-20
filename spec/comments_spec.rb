require 'bookmark'
require 'comment'

describe Comment do
  describe '.create' do
    it 'creates a comment' do

      bookmark = Bookmark.create(url: 'http://www.google.com', title: "Google")

      comment = Comment.create(text: 'this is a comment', bookmark_id: bookmark.id)

      #
      # database_row = get_comment_row_from_db(id: comment.id)
      # #
      # expect(database_row['title']).to eq 'Google'
      # expect(database_row['url']).to eq 'http://www.google.com'

      expect(comment).to be_a Comment

      expect(comment.text).to eq 'this is a comment'
      expect(comment.bookmark_id).to eq bookmark.id

    end
  end

  describe '.all' do
   it 'returns users comments' do

     bookmark = Bookmark.create(url: 'http://www.google.com', title: "Google")

     comment = Comment.create(text: 'this is a comment', bookmark_id: bookmark.id)
     comment2 = Comment.create(text: 'this is a comment', bookmark_id: bookmark.id)


      comments = Comment.all(bookmark.id)       #remember this test is specificlly testing the all class method

      expect(comments.length).to eq 2

      expect(comments.first).to be_a Comment
      expect(comments.first.text).to eq "this is a comment"
      expect(comments.first.bookmark_id).to eq bookmark.id

    end

  end
end
