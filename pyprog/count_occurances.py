def method1(str,char):
    print('Input String:',str)

    chars=set(str)
    cnt=0
    counts={}
    for i in chars:
        counts[i]=0

    for i in str:
        for j in counts.keys():
            if i == j:
                counts[i]+=1
                print(i,j,counts[i])

    print('Method1: ',counts[char])

def method2(str,char):
    print('Method2: ',str.count(char))

def method3(str,char):
    from collections import Counter

    count=Counter(str)
    print('Method3: ',count[char])

def method4(str,char):
    import re
    print('Method4: ',len(re.findall(char,str)))

method1("PawanKalyan",'a')
method2("PawanKalyan",'a')
method3("PawanKalyan",'a')
method4("PawanKalyan",'a')
