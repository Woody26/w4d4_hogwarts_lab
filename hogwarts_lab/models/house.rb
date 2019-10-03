require('pg')
require_relative( '../db/sql_runner')
require_relative( 'student_record')

class House

  attr_reader :id, :house_name, :house_logo

  def initialize( options)
    @id = options['id'].to_i() if options['id']
    @house_name = options['house_name']
    @house_logo = options['house_logo']
  end

  def save()
    sql = "INSERT INTO houses
    (
      house_name,
      house_logo
      ) VALUES (
        $1, $2
      ) RETURNING id"
        values = [@house_name, @house_logo]
        @id = SqlRunner.run(sql, values)[0]['id'].to_i()
  end

  def self.all()
    sql = "SELECT * FROM houses"
    houses = SqlRunner.run(sql)
    return houses.map { | house | Houses.new(house) }
  end

  def self.find(id)
    sql = "SELECT * FROM houses WHERE id = $1"
    values = [id]
    results = SqlRunner.rub(sql, values)
    house_hash = results.first()
    house = Houses.new(house_hash)
    return house 
  end
end
