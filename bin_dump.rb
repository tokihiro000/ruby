
def bin_dump(str, num)  
  num.times do |i|
    print format("%x", str[i])
  end
  puts ""
end

if __FILE__ == $0
  io = File.open('k1.txt', 'rb')
  s = io.gets
  bin_dump(s, 16)
end
