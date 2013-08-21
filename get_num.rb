str = "afafa1234fajopw531"
reg = /\d*/

if reg =~ str
  puts "matching"
else
  puts "no match"
end

array = Array.new
str.scan(reg) do |matched|
  array.push(matched)
end

p array
array.delete("")
p array
