hour = gets.to_i
min = gets.to_i
# this method turns the time into an angle between the watch strips
def your_angel(hour, min)
  an = (min * 6 - (hour * 60 + min) * 0.5).abs
  if an > 180
    360 - an .abs
  else
    an .abs
  end
end

puts "#{your_angel(hour, min)} degrees"
