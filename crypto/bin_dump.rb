# -*- coding: utf-8 -*-
def bin_dump(str)
  str.each_byte{|n| print format("%x", n) }
  puts ""
end

if __FILE__ == $0
  io = File.open('k1.txt', 'rb')
  s = io.gets
  bin_dump(s, 16)
end
