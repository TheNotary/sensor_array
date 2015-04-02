#!/bin/bash

### BEGIN INIT INFO
# Provides:          thin
# Required-Start:    $local_fs $remote_fs $network $syslog
# Required-Stop:     $local_fs $remote_fs $network $syslog
# Default-Start:     2 3 4 5
# Default-Stop:      0 1 6
# Short-Description: starts the thin web server
# Description:       starts thin
### END INIT INFO

# Add to auto-start on server start
# sudo update-rc.d sensor_array defaults
# Remove from auto-start
# sudo update-rc.d -f sensor_array remove

#RVM_ENV="ruby-2.0.0-p195@global"
RVM_ENV="default"
APP_NAME="sensor_array"
APP_PATH="/home/pi/dev/rails/$APP_NAME"
EUSER="pi"

RVM="source /home/pi/.rvm/environments/$RVM_ENV"

CMD="$RVM && cd $APP_PATH && bundle exec thin"
CMD_OPTS="start -e development -p 3000 -d"
PID="$APP_PATH/tmp/pids/thin.pid"

NAME=`basename $0`
DESC="Thin app for $APP_NAME"

case "$1" in
  start)
    echo -n "Starting $DESC: "
    su - $EUSER -c "$CMD $CMD_OPTS"
    echo "$NAME."
  ;;

  stop)
    echo -n "Stopping $DESC: "
    if [ -f $PID ] && [ -e /proc/$(cat $PID) ]
    then
      kill -QUIT `cat $PID`
      echo "$NAME."
    else
      echo "Unable to get $PID file, or process is down"
    fi
  ;;

  restart)
    echo -n "Restarting $DESC: "
    if [ -f $PID ] && [ -e /proc/$(cat $PID) ]
    then
      kill -USR2 `cat $PID`
    else
      su - $EUSER -c "$CMD $CMD_OPTS"
    fi
    echo "$NAME."
  ;;

  *)
    echo "Usage: $NAME {start|stop|restart}" >&2
    exit 1
  ;;
esac

exit 0
