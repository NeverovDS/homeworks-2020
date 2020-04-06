class Student
  attr_reader :name, :surname
  attr_accessor :mentor_student, :all_hw

  def initialize(name:, surname:)
    @name = name
    @surname = surname
    @all_hw = []
    @mentor_student = []
  end

  def notification_for_mentor(new_homework)
    mentor_student.each do |mentor|
      mentor.notification << Notification.new(self, homework: new_homework).new
    end
  end

  def submit_homework!(new_task)
    all_hw << new_task
    notification_for_mentor(new_task)
  end

  def view_homework_list
    puts("All homework #{name} #{surname} :#{all_hw}")
  end
end
