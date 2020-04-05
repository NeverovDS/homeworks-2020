require_relative 'student'
require_relative 'mentor'
require_relative 'homework'
require_relative 'notification'

student = Student.new(name: 'John', surname: 'Doe')
mentor = Mentor.new(name: 'Jack', surname: 'Gonzales')
task1 = Homework.new(hw_name: 'homework_1_t_1')

student.submit_homework!(task1.hw_name)
student.view_homework_list # => [Homework, ...]

mentor.subscribe_to(student)
mentor.notifications # => []

task2 = Homework.new(hw_name: 'homework_2_t_2')

student.submit_homework!(task2.hw_name)
mentor.notifications # => [Notification, ...]

mentor.read_notifications!
mentor.notifications # => []
