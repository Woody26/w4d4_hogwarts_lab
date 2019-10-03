require_relative( '../db/sql_runner')

class StudentRecord

  attr_reader :first_name, :last_name, :age, :house

  def initialize( options )
    @id = options['id'].to_i
    @first_name = options['first_name']
    @last_name = options['last_name']
    @age = options['age'].to_i
    @house = options['house']
  end

  def save()
    sql = "INSERT INTO student_records
    (
      first_name,
      last_name,
      age,
      house
      )
      values(
        $1, $2, $3, $4
        )
        RETURNING *"
        values = [@first_name, @last_name, @age, @house]
        student_data = SqlRunner.run( sql, values )
        @id = student_data.first()['id'].to_i
  end

  def self.all()
    sql = "SELECT * FROM student_records"
    students = SqlRunner.run(sql)
    result = students.map{ |student| StudentRecord.new( student ) }
    return result
  end

  def self.find(id)
    sql = "SELECT * FROM sdudent_records WHERE id = $1"
    value = [id]
    student = SqlRunner.run(sql, values)
    result = StudentRecord.new(student.first)
    return result
  end
end
