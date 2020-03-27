logs = File.readlines("#{__dir__}/logs_hw_02_t_01.txt")

def task_1(logs)
  logs.select do |line|
    line.downcase =~ /.*error.*/
  end
end

puts task_1(logs)
