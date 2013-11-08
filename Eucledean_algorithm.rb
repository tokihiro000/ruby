# -*- coding: utf-8 -*-

def Eucledean_algorithm(num_1, num_2)
  mod_1 = num_1 % num_2
  
  while mod_1 != 0 do
    num_1 = num_2
    num_2 = mod_1
    mod_1 = num_1 % num_2
  end
  
  return num_2
end  


if __FILE__ == $0
  n_1 = ARGV[0].to_i
  n_2 = ARGV[1].to_i
  
  result = Eucledean_algorithm(n_1, n_2)  
  print "最大公約数は", result, "\n"
end

