h = gets.to_i
m = gets.to_i
# this method turns the time into an angle between the watch strips
def your_angel(h, m)
  an = (m * 6 - (h * 60 + m) * 0.5).abs
  if an > 180
    360 - an .abs
  else
    an.abs
  end
end

puts "#{your_angel(h, m)} degrees"

