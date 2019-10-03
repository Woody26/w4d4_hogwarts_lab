require_relative( '../db/sql_runner')

class StudentRecord

  attr_reader :first_name, :last_name, :age, :house

  def initialize( options )
    @id = option['id'].to_i
    @first_name = options['first_name']
    @last_name = options['last_name']
    @age = options['age'].to_i
    @house = options['house']
  end
