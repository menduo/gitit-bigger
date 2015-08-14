#!/bin/bash
path_current_dir=$(cd `dirname $0`; pwd)
path_gitit_dir=$(cd $path_current_dir;cd ..;pwd)

cd $path_gitit_dir

case "$1" in
    start)
        nohup gitit -f my-gitit.conf > logs-gitit.log  2>&1 &
        ;;
    restart)
        ps aux |grep 'my-gitit.conf' | grep -v "grep" | awk '{print $2}' | xargs kill ; nohup gitit -f my-gitit.conf > logs-gitit.log 2>&1 &
        ;;
    stop)
        ps aux |grep 'my-gitit.conf' | grep -v "grep" | awk '{print $2}'  | xargs kill
        ;;
    *)
        echo "Usage: $0 {start | stop | restart}" >&2; exit 1
    ;;
esac

exit 0
