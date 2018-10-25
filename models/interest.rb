require_relative( '../db/sql_runner' )

class Interest

  attr_accessor( :customer_id, :game_id )
  attr_reader( :id )

  def initialize( options )
    @id = options['id'].to_i if options['id']
    @customer_id = options['customer_id'].to_i
    @game_id = options['game_id'].to_i
  end

  def save()
    sql = "INSERT INTO interests
    (
      game_id,
      customer_id
    )
    VALUES
    (
      $1, $2
    )
    RETURNING id"
    values = [@game_id, @customer_id]
    results = SqlRunner.run(sql, values)
    @id = results[0]['id'].to_i
  end

  def self.all()
    sql = "SELECT * FROM interests"
    results = SqlRunner.run( sql )
    return results.map { |i| Interest.new( i ) }
  end

  def customer()
    sql = "SELECT * FROM customers
    WHERE id = $1"
    values = [@customer_id]
    results = SqlRunner.run( sql, values )
    return Customer.new( results[0] )
  end

  def game()
    sql = "SELECT * FROM games
    WHERE id = $1"
    values = [@game_id]
    results = SqlRunner.run( sql, values )
    return Game.new( results[0] )
  end

  def self.delete_all()
    sql = "DELETE FROM interests"
    SqlRunner.run( sql )
  end

  def self.delete(id)
    sql = "DELETE FROM interests
    WHERE id = $1"
    values = [id]
    SqlRunner.run( sql, values )
  end

end
