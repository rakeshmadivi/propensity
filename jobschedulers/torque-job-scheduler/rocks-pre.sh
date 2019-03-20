
if [ -f /opt/tripwire/etc/twpol-parts/globals ]; then
	echo "rocks" | /opt/rocks/bin/ci /opt/tripwire/etc/twpol-parts/globals;
	/opt/rocks/bin/co -f -l /opt/tripwire/etc/twpol-parts/globals;
fi

if [ -f /tmp/server.info ]; then
	echo "rocks" | /opt/rocks/bin/ci /tmp/server.info;
	/opt/rocks/bin/co -f -l /tmp/server.info;
fi

if [ -f /etc/httpd/conf/httpd.conf ]; then
	echo "rocks" | /opt/rocks/bin/ci /etc/httpd/conf/httpd.conf;
	/opt/rocks/bin/co -f -l /etc/httpd/conf/httpd.conf;
fi

if [ -f /etc/ld.so.conf.d/ganglia.conf ]; then
	echo "rocks" | /opt/rocks/bin/ci /etc/ld.so.conf.d/ganglia.conf;
	/opt/rocks/bin/co -f -l /etc/ld.so.conf.d/ganglia.conf;
fi

if [ -f /etc/sysconfig/ntpd ]; then
	echo "rocks" | /opt/rocks/bin/ci /etc/sysconfig/ntpd;
	/opt/rocks/bin/co -f -l /etc/sysconfig/ntpd;
fi

if [ -f /etc/profile.d/rocks-lang.sh ]; then
	echo "rocks" | /opt/rocks/bin/ci /etc/profile.d/rocks-lang.sh;
	/opt/rocks/bin/co -f -l /etc/profile.d/rocks-lang.sh;
fi
chmod 0755 /etc/profile.d/rocks-lang.sh

if [ -f /etc/profile.d/java.csh ]; then
	echo "rocks" | /opt/rocks/bin/ci /etc/profile.d/java.csh;
	/opt/rocks/bin/co -f -l /etc/profile.d/java.csh;
fi
chmod 0755 /etc/profile.d/java.csh

if [ -f /etc/rc.d/rocksconfig.d/post-02-on-the-fly ]; then
	echo "rocks" | /opt/rocks/bin/ci /etc/rc.d/rocksconfig.d/post-02-on-the-fly;
	/opt/rocks/bin/co -f -l /etc/rc.d/rocksconfig.d/post-02-on-the-fly;
fi
chmod 755 /etc/rc.d/rocksconfig.d/post-02-on-the-fly

if [ -f /etc/profile.d/java.sh ]; then
	echo "rocks" | /opt/rocks/bin/ci /etc/profile.d/java.sh;
	/opt/rocks/bin/co -f -l /etc/profile.d/java.sh;
fi
chmod 0755 /etc/profile.d/java.sh

if [ -f /tmp/my.cnf ]; then
	echo "rocks" | /opt/rocks/bin/ci /tmp/my.cnf;
	/opt/rocks/bin/co -f -l /tmp/my.cnf;
fi

if [ -f /etc/rocks-release ]; then
	echo "rocks" | /opt/rocks/bin/ci /etc/rocks-release;
	/opt/rocks/bin/co -f -l /etc/rocks-release;
fi

if [ -f /etc/php.d/mysql.ini ]; then
	echo "rocks" | /opt/rocks/bin/ci /etc/php.d/mysql.ini;
	/opt/rocks/bin/co -f -l /etc/php.d/mysql.ini;
fi

if [ -f /etc/motd ]; then
	echo "rocks" | /opt/rocks/bin/ci /etc/motd;
	/opt/rocks/bin/co -f -l /etc/motd;
fi

if [ -f /etc/auto.master ]; then
	echo "rocks" | /opt/rocks/bin/ci /etc/auto.master;
	/opt/rocks/bin/co -f -l /etc/auto.master;
fi

if [ -f /etc/resolv.conf ]; then
	echo "rocks" | /opt/rocks/bin/ci /etc/resolv.conf;
	/opt/rocks/bin/co -f -l /etc/resolv.conf;
fi

if [ -f /etc/rc.d/rocksconfig.d/post-90-num-cpus ]; then
	echo "rocks" | /opt/rocks/bin/ci /etc/rc.d/rocksconfig.d/post-90-num-cpus;
	/opt/rocks/bin/co -f -l /etc/rc.d/rocksconfig.d/post-90-num-cpus;
fi
chmod 755 /etc/rc.d/rocksconfig.d/post-90-num-cpus

if [ -f /etc/fstab ]; then
	echo "rocks" | /opt/rocks/bin/ci /etc/fstab;
	/opt/rocks/bin/co -f -l /etc/fstab;
fi

if [ -f /etc/snmp/snmpd.conf ]; then
	echo "rocks" | /opt/rocks/bin/ci /etc/snmp/snmpd.conf;
	/opt/rocks/bin/co -f -l /etc/snmp/snmpd.conf;
fi

if [ -f /opt/maui/maui.cfg ]; then
	echo "rocks" | /opt/rocks/bin/ci /opt/maui/maui.cfg;
	/opt/rocks/bin/co -f -l /opt/maui/maui.cfg;
fi

if [ -f /etc/exports ]; then
	echo "rocks" | /opt/rocks/bin/ci /etc/exports;
	/opt/rocks/bin/co -f -l /etc/exports;
fi

if [ -f /etc/httpd/conf.d/411.conf ]; then
	echo "rocks" | /opt/rocks/bin/ci /etc/httpd/conf.d/411.conf;
	/opt/rocks/bin/co -f -l /etc/httpd/conf.d/411.conf;
fi

if [ -f /etc/ganglia/gmetad.conf ]; then
	echo "rocks" | /opt/rocks/bin/ci /etc/ganglia/gmetad.conf;
	/opt/rocks/bin/co -f -l /etc/ganglia/gmetad.conf;
fi

if [ -f /etc/cron.hourly/ntp ]; then
	echo "rocks" | /opt/rocks/bin/ci /etc/cron.hourly/ntp;
	/opt/rocks/bin/co -f -l /etc/cron.hourly/ntp;
fi
chmod 0755 /etc/cron.hourly/ntp

if [ -f /etc/ld.so.conf.d/foundation.conf ]; then
	echo "rocks" | /opt/rocks/bin/ci /etc/ld.so.conf.d/foundation.conf;
	/opt/rocks/bin/co -f -l /etc/ld.so.conf.d/foundation.conf;
fi

if [ -f /etc/rc.d/rocksconfig.d/post-10-kvm-save-dir ]; then
	echo "rocks" | /opt/rocks/bin/ci /etc/rc.d/rocksconfig.d/post-10-kvm-save-dir;
	/opt/rocks/bin/co -f -l /etc/rc.d/rocksconfig.d/post-10-kvm-save-dir;
fi
chmod 755 /etc/rc.d/rocksconfig.d/post-10-kvm-save-dir

if [ -f /etc/httpd/conf.d/mod_jk.conf ]; then
	echo "rocks" | /opt/rocks/bin/ci /etc/httpd/conf.d/mod_jk.conf;
	/opt/rocks/bin/co -f -l /etc/httpd/conf.d/mod_jk.conf;
fi

if [ -f /etc/rc.d/rocksconfig.d/post-01-cleanup-ks-scripts ]; then
	echo "rocks" | /opt/rocks/bin/ci /etc/rc.d/rocksconfig.d/post-01-cleanup-ks-scripts;
	/opt/rocks/bin/co -f -l /etc/rc.d/rocksconfig.d/post-01-cleanup-ks-scripts;
fi
chmod 0755 /etc/rc.d/rocksconfig.d/post-01-cleanup-ks-scripts

if [ -f /etc/inittab ]; then
	echo "rocks" | /opt/rocks/bin/ci /etc/inittab;
	/opt/rocks/bin/co -f -l /etc/inittab;
fi

if [ -f /etc/yum.conf ]; then
	echo "rocks" | /opt/rocks/bin/ci /etc/yum.conf;
	/opt/rocks/bin/co -f -l /etc/yum.conf;
fi

if [ -f /etc/postfix/main.cf ]; then
	echo "rocks" | /opt/rocks/bin/ci /etc/postfix/main.cf;
	/opt/rocks/bin/co -f -l /etc/postfix/main.cf;
fi

if [ -f /tmp/useradd ]; then
	echo "rocks" | /opt/rocks/bin/ci /tmp/useradd;
	/opt/rocks/bin/co -f -l /tmp/useradd;
fi

if [ -f /etc/httpd/conf/workers.properties ]; then
	echo "rocks" | /opt/rocks/bin/ci /etc/httpd/conf/workers.properties;
	/opt/rocks/bin/co -f -l /etc/httpd/conf/workers.properties;
fi

if [ -f /var/log/rocks-install.log ]; then
	echo "rocks" | /opt/rocks/bin/ci /var/log/rocks-install.log;
	/opt/rocks/bin/co -f -l /var/log/rocks-install.log;
fi

if [ -f /etc/profile.d/pbs-maui.csh ]; then
	echo "rocks" | /opt/rocks/bin/ci /etc/profile.d/pbs-maui.csh;
	/opt/rocks/bin/co -f -l /etc/profile.d/pbs-maui.csh;
fi
chmod 755 /etc/profile.d/pbs-maui.csh

if [ -f /etc/default/useradd ]; then
	echo "rocks" | /opt/rocks/bin/ci /etc/default/useradd;
	/opt/rocks/bin/co -f -l /etc/default/useradd;
fi
chmod 0600 /etc/default/useradd

if [ -f /etc/sysconfig/i18n ]; then
	echo "rocks" | /opt/rocks/bin/ci /etc/sysconfig/i18n;
	/opt/rocks/bin/co -f -l /etc/sysconfig/i18n;
fi

if [ -f /etc/rc.d/rocksconfig.d/post-02-rocks-dist ]; then
	echo "rocks" | /opt/rocks/bin/ci /etc/rc.d/rocksconfig.d/post-02-rocks-dist;
	/opt/rocks/bin/co -f -l /etc/rc.d/rocksconfig.d/post-02-rocks-dist;
fi
chmod 755 /etc/rc.d/rocksconfig.d/post-02-rocks-dist

if [ -f /tmp/grub.conf ]; then
	echo "rocks" | /opt/rocks/bin/ci /tmp/grub.conf;
	/opt/rocks/bin/co -f -l /tmp/grub.conf;
fi

if [ -f /etc/xinetd.d/tftp ]; then
	echo "rocks" | /opt/rocks/bin/ci /etc/xinetd.d/tftp;
	/opt/rocks/bin/co -f -l /etc/xinetd.d/tftp;
fi

if [ -f /etc/pam.d/sshd ]; then
	echo "rocks" | /opt/rocks/bin/ci /etc/pam.d/sshd;
	/opt/rocks/bin/co -f -l /etc/pam.d/sshd;
fi

if [ -f /etc/ld.so.conf.d/bio.conf ]; then
	echo "rocks" | /opt/rocks/bin/ci /etc/ld.so.conf.d/bio.conf;
	/opt/rocks/bin/co -f -l /etc/ld.so.conf.d/bio.conf;
fi

if [ -f /etc/rpm/macros.rocks ]; then
	echo "rocks" | /opt/rocks/bin/ci /etc/rpm/macros.rocks;
	/opt/rocks/bin/co -f -l /etc/rpm/macros.rocks;
fi
chmod 0644 /etc/rpm/macros.rocks

if [ -f /opt/torque/pbs.default ]; then
	echo "rocks" | /opt/rocks/bin/ci /opt/torque/pbs.default;
	/opt/rocks/bin/co -f -l /opt/torque/pbs.default;
fi

if [ -f /etc/rc.d/rocksconfig.d/pre-09-prep-kernel-source ]; then
	echo "rocks" | /opt/rocks/bin/ci /etc/rc.d/rocksconfig.d/pre-09-prep-kernel-source;
	/opt/rocks/bin/co -f -l /etc/rc.d/rocksconfig.d/pre-09-prep-kernel-source;
fi
chmod 755 /etc/rc.d/rocksconfig.d/pre-09-prep-kernel-source

if [ -f /etc/rc.d/rocksconfig.d/post-81-maui ]; then
	echo "rocks" | /opt/rocks/bin/ci /etc/rc.d/rocksconfig.d/post-81-maui;
	/opt/rocks/bin/co -f -l /etc/rc.d/rocksconfig.d/post-81-maui;
fi
chown root.root /etc/rc.d/rocksconfig.d/post-81-maui
chown root.root /etc/rc.d/rocksconfig.d/RCS/post-81-maui,v
chmod 0700 /etc/rc.d/rocksconfig.d/post-81-maui

if [ -f /etc/postfix/sender-canonical ]; then
	echo "rocks" | /opt/rocks/bin/ci /etc/postfix/sender-canonical;
	/opt/rocks/bin/co -f -l /etc/postfix/sender-canonical;
fi

if [ -f /etc/rc.d/rocksconfig.d/post-05-record-partitions ]; then
	echo "rocks" | /opt/rocks/bin/ci /etc/rc.d/rocksconfig.d/post-05-record-partitions;
	/opt/rocks/bin/co -f -l /etc/rc.d/rocksconfig.d/post-05-record-partitions;
fi
chmod 755 /etc/rc.d/rocksconfig.d/post-05-record-partitions

if [ -f /etc/torque-roll.conf ]; then
	echo "rocks" | /opt/rocks/bin/ci /etc/torque-roll.conf;
	/opt/rocks/bin/co -f -l /etc/torque-roll.conf;
fi

if [ -f /etc/rc.d/rc.local ]; then
	echo "rocks" | /opt/rocks/bin/ci /etc/rc.d/rc.local;
	/opt/rocks/bin/co -f -l /etc/rc.d/rc.local;
fi

if [ -f /etc/rc.d/init.d/rocks-tracker ]; then
	echo "rocks" | /opt/rocks/bin/ci /etc/rc.d/init.d/rocks-tracker;
	/opt/rocks/bin/co -f -l /etc/rc.d/init.d/rocks-tracker;
fi
chmod 755 /etc/rc.d/init.d/rocks-tracker

if [ -f /opt/bio/ncbi/bin/.ncbirc ]; then
	echo "rocks" | /opt/rocks/bin/ci /opt/bio/ncbi/bin/.ncbirc;
	/opt/rocks/bin/co -f -l /opt/bio/ncbi/bin/.ncbirc;
fi

if [ -f /etc/cron.hourly/make411 ]; then
	echo "rocks" | /opt/rocks/bin/ci /etc/cron.hourly/make411;
	/opt/rocks/bin/co -f -l /etc/cron.hourly/make411;
fi
chmod 0555 /etc/cron.hourly/make411

if [ -f /etc/ssh/sshd_config ]; then
	echo "rocks" | /opt/rocks/bin/ci /etc/ssh/sshd_config;
	/opt/rocks/bin/co -f -l /etc/ssh/sshd_config;
fi

if [ -f /etc/cron.hourly/ganglia-news ]; then
	echo "rocks" | /opt/rocks/bin/ci /etc/cron.hourly/ganglia-news;
	/opt/rocks/bin/co -f -l /etc/cron.hourly/ganglia-news;
fi
chmod 0755 /etc/cron.hourly/ganglia-news

if [ -f /etc/postfix/recipient-canonical ]; then
	echo "rocks" | /opt/rocks/bin/ci /etc/postfix/recipient-canonical;
	/opt/rocks/bin/co -f -l /etc/postfix/recipient-canonical;
fi

if [ -f /etc/php.ini ]; then
	echo "rocks" | /opt/rocks/bin/ci /etc/php.ini;
	/opt/rocks/bin/co -f -l /etc/php.ini;
fi

if [ -f /etc/httpd/conf/ssl.ca/Makefile ]; then
	echo "rocks" | /opt/rocks/bin/ci /etc/httpd/conf/ssl.ca/Makefile;
	/opt/rocks/bin/co -f -l /etc/httpd/conf/ssl.ca/Makefile;
fi

if [ -f /tmp/mdmonitor ]; then
	echo "rocks" | /opt/rocks/bin/ci /tmp/mdmonitor;
	/opt/rocks/bin/co -f -l /tmp/mdmonitor;
fi

if [ -f /etc/httpd/conf.d/central.conf ]; then
	echo "rocks" | /opt/rocks/bin/ci /etc/httpd/conf.d/central.conf;
	/opt/rocks/bin/co -f -l /etc/httpd/conf.d/central.conf;
fi

if [ -f /opt/torque/lib/xpbs/xpbsrc ]; then
	echo "rocks" | /opt/rocks/bin/ci /opt/torque/lib/xpbs/xpbsrc;
	/opt/rocks/bin/co -f -l /opt/torque/lib/xpbs/xpbsrc;
fi

if [ -f /tmp/tables.sql ]; then
	echo "rocks" | /opt/rocks/bin/ci /tmp/tables.sql;
	/opt/rocks/bin/co -f -l /tmp/tables.sql;
fi

if [ -f /etc/yum.repos.d/rocks-local.repo ]; then
	echo "rocks" | /opt/rocks/bin/ci /etc/yum.repos.d/rocks-local.repo;
	/opt/rocks/bin/co -f -l /etc/yum.repos.d/rocks-local.repo;
fi

if [ -f /etc/sysconfig/pbs_server ]; then
	echo "rocks" | /opt/rocks/bin/ci /etc/sysconfig/pbs_server;
	/opt/rocks/bin/co -f -l /etc/sysconfig/pbs_server;
fi

if [ -f /etc/man.config ]; then
	echo "rocks" | /opt/rocks/bin/ci /etc/man.config;
	/opt/rocks/bin/co -f -l /etc/man.config;
fi

if [ -f /etc/rc.d/rocksconfig.d/post-50-cluster-ssh-keys ]; then
	echo "rocks" | /opt/rocks/bin/ci /etc/rc.d/rocksconfig.d/post-50-cluster-ssh-keys;
	/opt/rocks/bin/co -f -l /etc/rc.d/rocksconfig.d/post-50-cluster-ssh-keys;
fi
chmod 700 /etc/rc.d/rocksconfig.d/post-50-cluster-ssh-keys

if [ -f /etc/httpd/conf.d/rocks.conf ]; then
	echo "rocks" | /opt/rocks/bin/ci /etc/httpd/conf.d/rocks.conf;
	/opt/rocks/bin/co -f -l /etc/httpd/conf.d/rocks.conf;
fi

if [ -f /tmp/all-rocks.js ]; then
	echo "rocks" | /opt/rocks/bin/ci /tmp/all-rocks.js;
	/opt/rocks/bin/co -f -l /tmp/all-rocks.js;
fi
chmod 0444 /tmp/all-rocks.js

if [ -f /tmp/ca.info ]; then
	echo "rocks" | /opt/rocks/bin/ci /tmp/ca.info;
	/opt/rocks/bin/co -f -l /tmp/ca.info;
fi

if [ -f /opt/torque/lib/xpbsmon/xpbsmonrc ]; then
	echo "rocks" | /opt/rocks/bin/ci /opt/torque/lib/xpbsmon/xpbsmonrc;
	/opt/rocks/bin/co -f -l /opt/torque/lib/xpbsmon/xpbsmonrc;
fi

if [ -f /etc/sysconfig/libvirtd ]; then
	echo "rocks" | /opt/rocks/bin/ci /etc/sysconfig/libvirtd;
	/opt/rocks/bin/co -f -l /etc/sysconfig/libvirtd;
fi

if [ -f /etc/sysconfig/network-scripts/network-functions ]; then
	echo "rocks" | /opt/rocks/bin/ci /etc/sysconfig/network-scripts/network-functions;
	/opt/rocks/bin/co -f -l /etc/sysconfig/network-scripts/network-functions;
fi

if [ -f /etc/profile.d/pbs-maui.sh ]; then
	echo "rocks" | /opt/rocks/bin/ci /etc/profile.d/pbs-maui.sh;
	/opt/rocks/bin/co -f -l /etc/profile.d/pbs-maui.sh;
fi
chmod 755 /etc/profile.d/pbs-maui.sh

if [ -f /tmp/db_partition_info.py ]; then
	echo "rocks" | /opt/rocks/bin/ci /tmp/db_partition_info.py;
	/opt/rocks/bin/co -f -l /tmp/db_partition_info.py;
fi

if [ -f /etc/security/ca/ca.cfg ]; then
	echo "rocks" | /opt/rocks/bin/ci /etc/security/ca/ca.cfg;
	/opt/rocks/bin/co -f -l /etc/security/ca/ca.cfg;
fi
chown root.apache /etc/security/ca/ca.cfg
chown root.apache /etc/security/ca/RCS/ca.cfg,v
chmod 0640 /etc/security/ca/ca.cfg

if [ -f /etc/rc.d/init.d/maui ]; then
	echo "rocks" | /opt/rocks/bin/ci /etc/rc.d/init.d/maui;
	/opt/rocks/bin/co -f -l /etc/rc.d/init.d/maui;
fi
chmod 755 /etc/rc.d/init.d/maui

if [ -f /etc/my.cnf ]; then
	echo "rocks" | /opt/rocks/bin/ci /etc/my.cnf;
	/opt/rocks/bin/co -f -l /etc/my.cnf;
fi
chmod 644 /etc/my.cnf

if [ -f /tmp/client.info ]; then
	echo "rocks" | /opt/rocks/bin/ci /tmp/client.info;
	/opt/rocks/bin/co -f -l /tmp/client.info;
fi

if [ -f /etc/sysconfig/trqauthd ]; then
	echo "rocks" | /opt/rocks/bin/ci /etc/sysconfig/trqauthd;
	/opt/rocks/bin/co -f -l /etc/sysconfig/trqauthd;
fi

if [ -f /tmp/categories.sql ]; then
	echo "rocks" | /opt/rocks/bin/ci /tmp/categories.sql;
	/opt/rocks/bin/co -f -l /tmp/categories.sql;
fi

if [ -f /tmp/ganglia-wp.sql ]; then
	echo "rocks" | /opt/rocks/bin/ci /tmp/ganglia-wp.sql;
	/opt/rocks/bin/co -f -l /tmp/ganglia-wp.sql;
fi

if [ -f /etc/ntp/step-tickers ]; then
	echo "rocks" | /opt/rocks/bin/ci /etc/ntp/step-tickers;
	/opt/rocks/bin/co -f -l /etc/ntp/step-tickers;
fi

if [ -f /etc/security/limits.d/91-infiniband.conf ]; then
	echo "rocks" | /opt/rocks/bin/ci /etc/security/limits.d/91-infiniband.conf;
	/opt/rocks/bin/co -f -l /etc/security/limits.d/91-infiniband.conf;
fi

if [ -f /export/site-roll/rocks/src/roll/restore/xen-restore.mk ]; then
	echo "rocks" | /opt/rocks/bin/ci /export/site-roll/rocks/src/roll/restore/xen-restore.mk;
	/opt/rocks/bin/co -f -l /export/site-roll/rocks/src/roll/restore/xen-restore.mk;
fi

if [ -f /etc/ssh/ssh_config ]; then
	echo "rocks" | /opt/rocks/bin/ci /etc/ssh/ssh_config;
	/opt/rocks/bin/co -f -l /etc/ssh/ssh_config;
fi

if [ -f /etc/udev/rules.d/95-infiniband.rules ]; then
	echo "rocks" | /opt/rocks/bin/ci /etc/udev/rules.d/95-infiniband.rules;
	/opt/rocks/bin/co -f -l /etc/udev/rules.d/95-infiniband.rules;
fi

if [ -f /etc/security/limits.conf ]; then
	echo "rocks" | /opt/rocks/bin/ci /etc/security/limits.conf;
	/opt/rocks/bin/co -f -l /etc/security/limits.conf;
fi

if [ -f /etc/auto.home ]; then
	echo "rocks" | /opt/rocks/bin/ci /etc/auto.home;
	/opt/rocks/bin/co -f -l /etc/auto.home;
fi

if [ -f /var/spool/torque/server_name ]; then
	echo "rocks" | /opt/rocks/bin/ci /var/spool/torque/server_name;
	/opt/rocks/bin/co -f -l /var/spool/torque/server_name;
fi

if [ -f /opt/maui/.ssh/id_rsa.pub ]; then
	echo "rocks" | /opt/rocks/bin/ci /opt/maui/.ssh/id_rsa.pub;
	/opt/rocks/bin/co -f -l /opt/maui/.ssh/id_rsa.pub;
fi
chmod 400 /opt/maui/.ssh/id_rsa.pub

if [ -f /var/www/html/tripwire/index.html ]; then
	echo "rocks" | /opt/rocks/bin/ci /var/www/html/tripwire/index.html;
	/opt/rocks/bin/co -f -l /var/www/html/tripwire/index.html;
fi
chown root.apache /var/www/html/tripwire/index.html
chown root.apache /var/www/html/tripwire/RCS/index.html,v

if [ -f /etc/profile.d/rocks-lang.csh ]; then
	echo "rocks" | /opt/rocks/bin/ci /etc/profile.d/rocks-lang.csh;
	/opt/rocks/bin/co -f -l /etc/profile.d/rocks-lang.csh;
fi
chmod 0755 /etc/profile.d/rocks-lang.csh

if [ -f /etc/rc.d/rocksconfig.d/post-90-restart-gmond ]; then
	echo "rocks" | /opt/rocks/bin/ci /etc/rc.d/rocksconfig.d/post-90-restart-gmond;
	/opt/rocks/bin/co -f -l /etc/rc.d/rocksconfig.d/post-90-restart-gmond;
fi
chmod 0755 /etc/rc.d/rocksconfig.d/post-90-restart-gmond

if [ -f /etc/rsyslog.conf ]; then
	echo "rocks" | /opt/rocks/bin/ci /etc/rsyslog.conf;
	/opt/rocks/bin/co -f -l /etc/rsyslog.conf;
fi

if [ -f /etc/rc.d/init.d/mdmonitor ]; then
	echo "rocks" | /opt/rocks/bin/ci /etc/rc.d/init.d/mdmonitor;
	/opt/rocks/bin/co -f -l /etc/rc.d/init.d/mdmonitor;
fi
chmod 755 /etc/rc.d/init.d/mdmonitor

if [ -f /etc/ld.so.conf ]; then
	echo "rocks" | /opt/rocks/bin/ci /etc/ld.so.conf;
	/opt/rocks/bin/co -f -l /etc/ld.so.conf;
fi

if [ -f /etc/sysctl.conf ]; then
	echo "rocks" | /opt/rocks/bin/ci /etc/sysctl.conf;
	/opt/rocks/bin/co -f -l /etc/sysctl.conf;
fi

if [ -f /tmp/insert-rolls.sql ]; then
	echo "rocks" | /opt/rocks/bin/ci /tmp/insert-rolls.sql;
	/opt/rocks/bin/co -f -l /tmp/insert-rolls.sql;
fi

if [ -f /etc/aliases ]; then
	echo "rocks" | /opt/rocks/bin/ci /etc/aliases;
	/opt/rocks/bin/co -f -l /etc/aliases;
fi

if [ -f /var/cluster/born-on ]; then
	echo "rocks" | /opt/rocks/bin/ci /var/cluster/born-on;
	/opt/rocks/bin/co -f -l /var/cluster/born-on;
fi

if [ -f /tmp/tripwire-wp.sql ]; then
	echo "rocks" | /opt/rocks/bin/ci /tmp/tripwire-wp.sql;
	/opt/rocks/bin/co -f -l /tmp/tripwire-wp.sql;
fi

if [ -f /etc/selinux/config ]; then
	echo "rocks" | /opt/rocks/bin/ci /etc/selinux/config;
	/opt/rocks/bin/co -f -l /etc/selinux/config;
fi

if [ -f /etc/auto.share ]; then
	echo "rocks" | /opt/rocks/bin/ci /etc/auto.share;
	/opt/rocks/bin/co -f -l /etc/auto.share;
fi
