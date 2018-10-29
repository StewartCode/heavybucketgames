require_relative( '../db/sql_runner' )

class Id_input

  attr_accessor( :id_input)
  attr_reader(:id)

  def initialize( options )
    @id = options['id'].to_i if options['id']
    @id_input = options['id_input']
  end

  def save()
    sql = "INSERT INTO id_inputs
    (
      Id_input
    )
    VALUES
    (
      $1
    )
    RETURNING id"
    values = [@id_input]
    results = SqlRunner.run(sql, values)
    @id = results[0]['id'].to_i
  end

  def self.all()
    sql = "SELECT * FROM id_inputs"
    results = SqlRunner.run( sql )
    return results.map { |i| Id_input.new( i ) }
  end

  def update()
    sql = "UPDATE id_inputs
    SET
    (
      id_input
    ) =
    (
      $1
    )
    WHERE id = $2"
    values = [@id_input, @id]
    SqlRunner.run(sql, values)
  end

  def self.find( id )
    sql = "SELECT * FROM id_inputs
    WHERE id = $1"
    values = [id]
    results = SqlRunner.run( sql, values )
    return Id_input.new( results[0] )
  end

  def self.delete_all
    sql = "DELETE FROM id_inputs"
    SqlRunner.run( sql )
  end

  def self.delete(id)
    sql = "DELETE FROM id_inputs
    WHERE id = $1"
    values = [id]
    SqlRunner.run( sql, values )
  end

end
