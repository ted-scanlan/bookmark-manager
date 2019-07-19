require 'pg'

class Database_connection

  def self.setup(dbname)
    @connection = PG.connect(dbname: dbname)

  end

  # def self.connection  #can be removed as the self.qeury relies on the persistent connection created by set_up, so the connection doesnt need to be tested
  #   @connection
  #
  # end

  def self.query(sql)
    @connection.exec(sql)
end

end
