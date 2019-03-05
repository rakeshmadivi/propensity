# Creating an empty Dictionary 
Dict = {} 
print("Empty Dictionary: ") 
print(Dict) 
  
# Creating a Dictionary  
# with Integer Keys 
Dict = {1: 'Rakesh', 2: 'For', 3: 'Rakesh'} 
print("\nDictionary with the use of Integer Keys: ") 
print(Dict) 

# Creating a Dictionary  
# with Mixed keys 
Dict = {'Name': 'Rakesh', 1: [1, 2, 3, 4]} 
print("\nDictionary with the use of Mixed Keys: ") 
print(Dict) 

# Creating a Dictionary 
# with dict() method 
Dict = dict({1: 'Rakesh', 2: 'For', 3:'Rakesh'}) 
print("\nDictionary with the use of dict(): ") 
print(Dict) 

# Creating a Dictionary 
# with each item as a Pair 
Dict = dict([(1, 'Rakesh'), (2, 'For')]) 
print("\nDictionary with each item as a pair: ") 
print(Dict) 

# Adding multiple values to a key
Dict['multi_val']=1,2,3

print('After adding multi-values to a key')
print(Dict)

# Access Dict elements
"""
Two Possibilities for accessing
1. using key ex. Dict['multi_val'],Dict[2]
2. using get() Ex. Dict.get(2)
"""

print('Accessing Elements of Dictionary: ',Dict[2],Dict.get('multi_val'))



# DELETING ELEMENTS FROM DICTIONARY
"""
Possible Options for deletion
1. del
2. pop() - specifying the index to pop
3. popitem() - pops out first element
"""
print('Deleting Dictionary Items:')
del Dict[2]
print('After del :',Dict)

Dict.pop(1)
print('After pop :',Dict)

Dict[4]='val4'
print('After val4: ',Dict)
Dict.popitem()
print('After popitem :',Dict)

