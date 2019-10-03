require('sinatra')
require('sinatra/contrib/all')
require('pry-byebug')

require_relative("./models/student_record")
also_reload("./models/*")


get "/student-records" do
  @students = StudentRecord.all()
  erb(:index)
end

get "/student-records/new" do
  erb(:new)
end

post "/student-records" do
  @student = StudentRecord.new(params)
  @student.save()
  redirect to ("/student-records")
end
