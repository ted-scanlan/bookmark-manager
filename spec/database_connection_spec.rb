
describe Database_connection do
describe '.setup' do
  it 'sets up a connection to a database through PG ' do
    expect(PG).to receive(:connect).with(dbname: 'bookmark_manager_test')

    Database_connection.setup('bookmark_manager_test')

end
end
end
