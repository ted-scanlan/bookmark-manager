class Comment
attr_reader :text, :bookmark_id

  def initialize(text:, bookmark_id:)
    @text = text
    @bookmark_id = bookmark_id
  end

def self.create(text:, bookmark_id:)

result =   Database_connection.query("INSERT INTO comments (text, bookmark_id) VALUES('#{text}', '#{bookmark_id}') returning text, bookmark_id;")

Comment.new(text: result[0]['text'], bookmark_id: result[0]['bookmark_id'])

end

def self.all(bookmark_id)

result =   Database_connection.query("SELECT * FROM comments WHERE bookmark_id = #{bookmark_id}")

result.map do |comment|
    Comment.new(text: comment["text"], bookmark_id: comment["bookmark_id"])
    end

end

end
