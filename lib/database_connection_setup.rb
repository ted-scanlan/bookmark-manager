require './lib/database_connection'

if ENV['ENVIRONMENT'] == 'test'
  Database_connection.setup('bookmark_manager_test')
else
  Database_connection.setup('bookmark_manager')
end 
