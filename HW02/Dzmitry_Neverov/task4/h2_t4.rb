def task_4(some_str)
  letters = some_str.scan(/[a-zA-z]/)
  digits = some_str.scan(/[0-9]/)
  puts "letters: #{letters.length}, digits: #{digits.length}"
end

task_4('hel2!lo')
task_4('wicked .. !')
task_4('aasd123456a')
