
# Import Packages
import math as mt

# Import posit library
import posit as pnu

############## HELPER FUNCTIONS ######################

def log2(n):
    return (mt.log10(n)/mt.log10(2))

def check_powerof2(n):
    return (mt.ceil(log2(n))==mt.floor(log2(n)))


############ MAIN ENTRY ########################
i_p=input('Enter the binary string: ')

ip_set=set(list(i_p))
target_set={'0','1'}


# Throw error if not Binary string
if not ip_set <= target_set :
    raise Exception("Invalid string: Requires binary string." )

else:
    # Check if the length is power of 2
    # logA(b) = logX(b)/logX(A) where X is available system log Eg. log_base10
    if not check_powerof2(len(i_p)):
        raise Exception('Invalid length of string: String length should be power of 2')
    
    # Perform required operations on the string.
    print(i_p,ip_set)
    pclass=pnu.Posit(i_p,i_p) #posit2float(i_p)
    pclass.p2flt(i_p)
    pclass.pExcep(i_p)

