logs = File.readlines("#{__dir__}/file_with_logs.txt")

def task_1(logs)
  logs.select do |line|
    line.downcase =~ /.*error.*/
  end
end

puts task_1(logs)
