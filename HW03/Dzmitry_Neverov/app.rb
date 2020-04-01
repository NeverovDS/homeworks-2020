require_relative 'student'
require_relative 'mentor'
require_relative 'homework'
require_relative 'notification'
module App
  def self.run
    student = Student.new(name: 'John', surname: 'Doe')
    mentor = Mentor.new(name: 'Jack', surname: 'Gonzales')

    student.submit_homework!('homework_1_t_1', student)
    student.homework_list # => [Homework, ...]

    mentor.subscribe_to(student)
    mentor.notifications # => []

    student.submit_homework!('homework_2_t_2', student)
    mentor.notifications # => [Notification, ...]

    mentor.read_notifications!
    mentor.notifications # => []
  end
end

App.run
