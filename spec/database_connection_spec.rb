
describe Database_connection do
describe '.setup' do
  it 'sets up a connection to a database through PG ' do
    expect(PG).to receive(:connect).with(dbname: 'bookmark_manager_test')

    Database_connection.setup('bookmark_manager_test')

end

# it 'this connection is persistent' do
#   connection = Database_connection.setup('bookmark_manager_test')
#
#   expect(Database_connection.connection).to eq connection
#
# end


end

describe '.query' do
  it 'executes a query via PG' do
    connection = Database_connection.setup('bookmark_manager_test')

    expect(connection).to receive(:exec).with("SELECT * FROM bookmarks;")
    connection.exec("SELECT * FROM bookmarks;")
end
end
end
