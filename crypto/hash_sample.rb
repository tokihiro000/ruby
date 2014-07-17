list = [1, 2, 3]
list2 = [2, 4, 5]
list3 = [3, 4, 6]
h = {list => 1, list2 => 1}
#h[list3] = "hint"
h[list2] += 1
p h[list2]
