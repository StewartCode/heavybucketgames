require_relative( '../db/sql_runner' )

class Customer

  attr_accessor( :name, :email)
  attr_reader(:id)

  def initialize( options )
    @id = options['id'].to_i if options['id']
    @name = options['name']
    @email = options['email']
  end

  def save()
    sql = "INSERT INTO customers
    (
      name,
      email
    )
    VALUES
    (
      $1, $2
    )
    RETURNING id"
    values = [@name, @email]
    results = SqlRunner.run(sql, values)
    @id = results[0]['id'].to_i
  end

  def games
    sql = "SELECT games.*
           FROM games
           INNER JOIN interests
           ON interests.game_id = games.id
           WHERE customer_id = $1;"
    values = [@id]
    results = SqlRunner.run(sql, values)
    return results.map { |g| Game.new(g) }
  end

  def self.all()
    sql = "SELECT * FROM customers"
    results = SqlRunner.run( sql )
    return results.map { |c| Customer.new( c ) }
  end

  def self.find( id )
    sql = "SELECT * FROM customers
    WHERE id = $1"
    values = [id]
    results = SqlRunner.run( sql, values )
    return Customer.new( results[0] )
  end

  def self.delete_all
    sql = "DELETE FROM customers"
    SqlRunner.run( sql )
  end

  def self.delete(id)
    sql = "DELETE FROM customers
    WHERE id = $1"
    values = [id]
    SqlRunner.run( sql, values )
  end

end
