from itertools import permutations,combinations
from itertools import combinations_with_replacement as c_w_r

l1=[1,2,3]
#l2=[1,1,4]
l2="Rakesh"

print("Permutaions: "+str(list(permutations(l1))))
print("Permutaions(2): "+str(list(permutations(l1,2))))

print("Combinations(3): "+str(list(combinations(l1,3))))
print("Combonations(2): "+str(list(combinations(l1,2))))

# Combinations with and without based on values.
# Without value based, results in duplicate combinations
# With value based, results in unique combinations

print("Combinations(3): "+str(list(combinations(l2,len(l2)))))
print("c_w_r(3): "+str(list(c_w_r(l2,len(l2)))))

print("Combonations(2): "+str(list(combinations(l2,2))))
print("c_w_r(2): "+str(list(c_w_r(l2,2))))
