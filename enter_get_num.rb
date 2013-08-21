# -*- coding: utf-8 -*-

def get_num(str)
  reg = /\d*/  
  array = Array.new
  str.scan(reg) do |matched|
    array.push(matched)
  end  
  
  array.delete("")
  array.map!(&:to_i)
  return array
end

if __FILE__ == $0                                  #このプログラムが単体で実行される場合のみ以下を実行
  s = ARGV[0]
  a = get_num(s)
  p a
end

