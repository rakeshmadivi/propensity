# Program to find:
# Mean, Variance, Standard Deviation
import sys
import math
import statistics as st

if len(sys.argv) <= 1 :
    print("Error: Not enough arguments passed.")
    exit()

def manual_fqdev(freq):
    '''
    x' = [(x=i->N)sum(f_i * x_i)]/sum(f)
    '''
    fx_sum = 0
    f_sum = 0
    for i in range(len(freq)):
        fx_sum += (i+1)*freq[i]
        f_sum += freq[i]

    fq_dev = fx_sum / f_sum
    print("fx_sum = %s; f_sum = %s; freq_deviation = %s" % (fx_sum,f_sum,fq_dev) )

def manual_stdev(ip):
    tot=0
    #mean=23.0
    ip_size = len(ip)
    print("Input: "+str(ip)+"\nSize: "+str(ip_size))

    for i in ip:
        #print(unicode(i).isnumeric())
        tot += i #float(i)

    mean = tot / ip_size
    print("Total = %s Mean = %s" %(tot,mean))

    variance = 0
    for val in ip:
        variance += (val-mean)**2

    variance /= ip_size-1
    print("Variance = %f" %(variance))

    stdeviation = math.sqrt(variance)
    print("Standard Deviation = %f " % (stdeviation))


if __name__ == "__main__" :
    ip = [ float(x) for x in sys.argv[1:] ]
    #manual_stdev(ip)
    print("stddev(%s)(Using statistics package) = %s" % (ip,st.stdev(ip)))

    # Frequency Distribution
    manual_fqdev(ip)
