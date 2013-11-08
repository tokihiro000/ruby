number = ARGV[0].to_i

array = Array.new
sosu_array = Array.new
2.upto(number) do |x|
    array << x
end

base_num = array.shift
sosu_array << base_num
while array.size != 0 do  
  size = array.size
  0.upto(size) do |i|    
    a = array.at(i)  
    if a != nil
      b = (a % base_num)
    elsif
      b = 1
    end
  
    if b == 0    
      array.delete_at(i)
    end    
  end
  base_num = array.shift
  sosu_array << base_num
  #print "array = ", array, "\n"
end

p sosu_array
