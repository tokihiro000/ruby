str = "T O M M A R V O L O R I D D L E"
array = str.split();
p array
first_name = array[0..2].to_s
middle_name = array[3..9].to_s
last_name = array[10..15].to_s
print first_name, " ", middle_name, " ", last_name, "\n"
puts ""

p array	
s_a = array.values_at(11)
p s_a
v_a = array.values_at(4, 3)
p v_a
adj_a = array.values_at(8, 9, 10, 12)
p adj_a
c_a = array.values_at(6, 7, 14, 13, 15, 2, 1, 5, 0)
p c_a

s = s_a.to_s; v = v_a.to_s; adj = adj_a.to_s; c = c_a.to_s;

print s, " ", v, " ", adj, " ", c, "\n"