#!/bin/bash
path_current_dir=$(cd `dirname $0`; pwd)
path_gitit_dir=$(cd $path_current_dir;cd ..;pwd)

cd $path_gitit_dir

case "$1" in
    start)
        nohup gitit -f my-gitit.conf>logs-gitit.log&
        ;;
    restart)
        pkill gitit && nohup gitit -f my-gitit.conf>logs-gitit.log&
        ;;
    stop)
        pkill gitit
        ;;
    *)
        echo "Usage: $0 {start | stop | restart}" >&2; exit 1
    ;;
esac

exit 0
