#!/bin/bash
path_current_dir=$(cd `dirname $0`; pwd)
path_parrent_dir=$(cd $path_current_dir;cd ..;pwd)

cd $path_parrent_dir

conf_file=my-gitit.conf
pid_file=pid-my-gitit.conf.pid
log_file=logs-gitit.log

case "$1" in
    start)
        nohup gitit -f $conf_file > $log_file  & echo $! > $pid_file 2>&1 &
        ;;
    restart)
        cat $pid_file | xargs kill ; nohup gitit -f $conf_file > $log_file  & echo $! > $pid_file 2>&1 &
        ;;
    stop)
        cat $pid_file | xargs kill; echo "stoped $conf_file"
        ;;
    *)
        echo "Usage: $0 {start | stop | restart}" >&2; exit 1
    ;;
esac

exit 1
