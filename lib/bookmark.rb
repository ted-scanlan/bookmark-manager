require 'pg'
require_relative 'database_connection'

class Bookmark
  attr_reader :title, :url, :id
  def initialize(id:, title:, url:)
    @id = id
    @title = title
    @url = url

  end

  def self.all

    # if ENV['ENVIRONMENT'] == 'test'
    #   connection = PG.connect(dbname: 'bookmark_manager_test')
    # else
    # connection = PG.connect(dbname: 'bookmark_manager')
    # end
    # result = connection.exec("SELECT * FROM bookmarks;")
  result = Database_connection.query("SELECT * FROM bookmarks")
  result.map do |bookmark|
      Bookmark.new(id: bookmark["id"], title: bookmark["title"], url: bookmark["url"])
      end
    end


  def self.create(url:, title:)     #why symbol
    # if ENV['ENVIRONMENT'] == 'test'
    #   connection = PG.connect(dbname: 'bookmark_manager_test')
    # else
    #   connection = PG.connect(dbname: 'bookmark_manager')
    # end
      # result = connection.exec("INSERT INTO bookmarks (title, url) VALUES('#{title}','#{url}') RETURNING id, url, title")   # why is this RETURNING but neccessary?
      result = Database_connection.query("INSERT INTO bookmarks (title, url) VALUES('#{title}','#{url}') RETURNING id, url, title")
      Bookmark.new(id: result[0]['id'], title: result[0]['title'], url: result[0]['url'])
      # Bookmark.new(id: 1, url: url, title: title)
  end



def self.delete(id:)
#   if ENV['ENVIRONMENT'] == 'test'
#     connection = PG.connect(dbname: 'bookmark_manager_test')
#   else
#   connection = PG.connect(dbname: 'bookmark_manager')
# end
#connection.exec("DELETE FROM bookmarks WHERE id = #{id}")
result = Database_connection.query("DELETE FROM bookmarks WHERE id = #{id}")

end

def self.update(id:, url:, title: )
#   if ENV['ENVIRONMENT'] == 'test'
#     connection = PG.connect(dbname: 'bookmark_manager_test')
#   else
#   connection = PG.connect(dbname: 'bookmark_manager')
# end
# result = connection.exec("UPDATE bookmarks SET url = '#{url}', title = '#{title}' WHERE id = '#{id}' RETURNING id, url, title;")
result = Database_connection.query("UPDATE bookmarks SET url = '#{url}', title = '#{title}' WHERE id = '#{id}' RETURNING id, url, title;")
Bookmark.new(id: result[0]['id'], title: result[0]['title'], url: result[0]['url'])
end



def self.find(id:)
  #
  # if ENV['ENVIRONMENT'] == 'test'
  #   connection = PG.connect(dbname: 'bookmark_manager_test')
  # else
  # connection = PG.connect(dbname: 'bookmark_manager')
  # end

#result = connection.exec("SELECT * FROM bookmarks WHERE id = #{id};")
result = Database_connection.query("SELECT * FROM bookmarks WHERE id = #{id};")
  Bookmark.new(id: result[0]['id'], title: result[0]['title'], url: result[0]['url'])
end
end
