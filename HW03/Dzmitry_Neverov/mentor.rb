class Mentor
  attr_reader :name, :surname, :notification
  attr_accessor :all_hw
  def initialize(name:, surname:)
    @name = name
    @surname = surname
    @notification = []
  end

  def subscribe_to(student)
    student.mentor_student << self
    puts("Mentor subscribe to #{student.name} #{student.surname}")
  end

  def notifications
    notification.empty? ? puts('0 notification') : puts(notification.to_s)
  end

  def read_notifications!
    puts('Mentor read notification')
    notification.clear
  end
end
