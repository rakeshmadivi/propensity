
# BASIC POSIT CONVENTION
# sign-regime-es-fraction/mantissa

# Convert posit string to float
def posit2float(self,posit):
    print('Converting: posit -> Float')

def pExceptions(self,posit):
    #print('Checking Exceptions',posit,len(posit),posit.count('0'))
    # Only 2 exceptions 0 or +/- INF
    if posit.count('0') == len(posit):
        print('ZERO')

    if posit[0] == '1' and posit.count('0') == (len(posit)-1):
        print('+/- Infinity')


# POSIT CLASS
class Posit:

    # 
    
    def __init__(self,a,b):
        self.pa=a
        self.pb=b
        self.fa=0.0
        self.fb=0.0

    # posit2float
    p2flt=posit2float
    pExcep=pExceptions

