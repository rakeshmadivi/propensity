######################################################################################################
#   DYNAMIC PROGRAMMING
######################################################################################################

# Method-1: Tabulation
def tabulation(factn):
    def tabfact(n):
        print('Factorial('+str(n)+') = ',end='')
        tab=[]
        tab.insert(0,1)
        for i in range(1,n+1):
            tab.insert(i,tab[i-1]*i)
        return tab[n]
    print(tabfact(factn))


# Method-2: Memorization
def memorization(factn):
    def memfact(n):
        state=[-1 for i in range(n+1)]
        if n == 0:
            return 1
        elif state[n] != -1 :
            return state[n]
        else:
            state[n] = n * memfact(n-1)
        return state[n]
            
    print('Method2_Factorial('+str(factn)+'): '+str(memfact(factn)))

############################# MAIN DRIVING ###############
tabulation(9)
memorization(9)
