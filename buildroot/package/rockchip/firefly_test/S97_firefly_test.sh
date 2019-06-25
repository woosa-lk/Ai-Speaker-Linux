#!/bin/bash
Fire_Dir="/var/cache/firefly"
Mnt="/mnt"
K=$1
firefly_update=0
mount_flag=false

rsacheck_init

update_tool()
{
if [ -d $Mnt/firefly-test ]; then
	echo "update firefly-test ... "
		if [ -d $Fire_Dir ]; then
	       		rm $Fire_Dir/ -fr
		fi
       	cp -rf $Mnt/firefly-test $Fire_Dir/
	firefly_update=1
fi
}

kill_proc()
{
NAME="/var/cache/firefly"
echo $NAME
ID=`ps -ef | grep "$NAME" | grep -v "$0" | grep -v "grep" | awk '{print $2}'`
echo $ID
echo "---------------"
for id in $ID
do
kill -9 $id
echo "killed $id"
done
echo "---------------"
}


if [ "$K" = "k" ] || [ "$K" = "K" ] || [ "$K" = "1" ]; then
	kill_proc
	exit 1
fi

case "$K" in
    start)
        for dev in `(find /dev -name 'mmcblk0*' -o -name 'sd*')`; do
            if mount $dev $Mnt &>/dev/null; then
                update_tool
                mount_flag=true
                umount $Mnt
                if [ $firefly_update = 1 ]; then
                    break
                fi
            fi
        done

        if rsacheck $Fire_Dir; then
            cd $Fire_Dir
            bash ./startup_emmc.sh $firefly_update
        fi
        ;;
    stop)
        printf "stop finished\n"
        ;;
    *)
        echo "Usage: $0 {start|stop}"
        exit 1
        ;;
esac
exit 0
