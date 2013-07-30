str = "T O M M A R V O L O R I D D L E"
array = str.split();
p array
first_name = array[0..2].to_s
middle_name = array[3..9].to_s
last_name = array[10..15].to_s
print first_name, " ", middle_name, " ", last_name, "\n"
puts ""

s = array[11].to_s
tmp = array[3..4]
tmp.reverse!
v = tmp.to_s
adj_a = array[8..10]
adj_a[3] = array[13]
adj = adj_a.to_s
c_a = array[6..8]
c_a[3] = array[12]
c_a[4] = array[15]
c_a[5] = array[2]
c_a[6] = array[1]
c_a[7] = array[5]
c_a[8] = array[0]
c = c_a.to_s

p array	
print s, " ", v, " ", adj, " ", c, "\n"
