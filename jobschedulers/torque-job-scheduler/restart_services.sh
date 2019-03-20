for i in {0..5};do ssh n${i} "ls /share/apps";done
for i in {0..5};do ssh n${i} "service pbs_mom restart";done
for i in {0..5};do ssh n${i} "pgrep pbs_mom";done

for i in {0..5};do ssh n${i} "tail /var/spool/torque/mom_logs/20171013";done
