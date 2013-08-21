require 'enter_get_num.rb'

name = ARGV[0]
io = File.open(name, 'rb')

num_array = Array.new
while line = io.gets
  num_array << get_num(line)
end

p num_array
