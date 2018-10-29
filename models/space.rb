require_relative( '../db/sql_runner' )

class Space

  attr_accessor( :jumper_spaces, :timefist_spaces )
  attr_reader(:id)

  def initialize( options )
    @id = options['id'].to_i if options['id']
    @jumper_spaces = options['jumper_spaces']
    @timefist_spaces = options['timefist_spaces']
  end

  def save()
    sql = "INSERT INTO spaces
    (
      jumper_spaces,
      timefist_spaces
    )
    VALUES
    (
      $1, $2
    )
    RETURNING id"
    values = [@jumper_spaces, @timefist_spaces]
    results = SqlRunner.run(sql, values)
    @id = results[0]['id'].to_i
  end

  def self.all()
    sql = "SELECT * FROM spaces"
    results = SqlRunner.run( sql )
    return results.map { |i| Space.new( i ) }
  end

  def self.find( id )
    sql = "SELECT * FROM spaces
    WHERE id = $1"
    values = [id]
    results = SqlRunner.run( sql, values )
    return Space.new( results[0] )
  end

  def self.delete_all
    sql = "DELETE FROM spaces"
    SqlRunner.run( sql )
  end

  def self.delete(id)
    sql = "DELETE FROM spaces
    WHERE id = $1"
    values = [id]
    SqlRunner.run( sql, values )
  end

  def update()
    sql = "UPDATE spaces
    SET
    (
      jumper_spaces,
      timefist_spaces
    ) =
    (
      $1, $2
    )
    WHERE id = $3"
    values = [@jumper_spaces, @timefist_spaces, @id]
    SqlRunner.run(sql, values)
  end

  def jumper_spaces_left(x)
      y = x += jumper_spaces
    return y
  end

  def timefist_spaces_left(x)
      y = x += timefist_spaces
      return y
  end
end
