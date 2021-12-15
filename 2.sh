read FUNC
#!bin/bash
PIDLOG=pid_log.txt
MEMLOG=mem_log.csv
if [ "$FUNC" = "START" ]; 
then
    (while true
    do
        1>>$MEMLOG "date"
        #1>>$MEMLOG grep MemFree /proc/meminfo
        #1>>$MEMLOG grep MemTotal /proc/meminfo
        #echo "$!"
        sleep 10m
    done)&
    1>$PIDLOG echo "$!"
fi

if [ "$FUNC" = "STATUS" ];  
then 
    exec<$PIDLOG && read PID
    if [ "$PID" = "" ];
        then echo "Process is not running"
    else echo "Process is running"
    fi
fi

if [ "$FUNC" = "STOP" ];
then
    exec<$PIDLOG && read PID
    #echo $PID
    kill $PID
    1>$PIDLOG echo
fi

 
