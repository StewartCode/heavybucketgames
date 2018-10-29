require_relative( '../db/sql_runner' )

class Game

  attr_accessor( :title, :genre, :release_date, :jumper_spaces, :timefist_spaces)
  attr_reader(:id)


  def initialize( options )
    @id = options['id'].to_i if options['id']
    @title = options['title']
    @genre = options['genre']
    @release_date = options['release_date']
    @jumper_spaces = options['jumper_spaces']
    @timefist_spaces = options['timefist_spaces']
  end

  def save()
    sql = "INSERT INTO games
    (
      title,
      genre,
      release_date,
      jumper_spaces,
      timefist_spaces
    )
    VALUES
    (
      $1, $2, $3, $4, $5
    )
    RETURNING id"
    values = [@title, @genre, @release_date, @jumper_spaces, @timefist_spaces]
    results = SqlRunner.run(sql, values)
    @id = results[0]['id'].to_i
  end

  def customers
    sql = "SELECT customers.*
           FROM customers
           INNER JOIN interests
           ON interests.customer_id = customers.id
           WHERE game_id = $1;"
    values = [@id]
    results = SqlRunner.run(sql, values)
    return results.map { |c| Customer.new(c) }
  end

  def self.all()
    sql = "SELECT * FROM games"
    results = SqlRunner.run( sql )
    return results.map { |g| Game.new( g ) }
  end

  def self.find( id )
    sql = "SELECT * FROM games
    WHERE id = $1"
    values = [id]
    results = SqlRunner.run( sql, values )
    return Game.new( results[0] )
  end

  def self.delete_all
    sql = "DELETE FROM games"
    SqlRunner.run( sql )
  end

  def self.delete(id)
    sql = "DELETE FROM games
    WHERE id = $1"
    values = [id]
    SqlRunner.run( sql, values )
  end

def timefist_spaces_left(x)
    return x += @timefist_spaces
  end

def jumper_spaces_left(x)
    return x += @jumper_spaces
  end

end
