#
# Regular cron jobs for the nginx package
#
0 4	* * *	root	[ -x /usr/bin/nginx_maintenance ] && /usr/bin/nginx_maintenance
