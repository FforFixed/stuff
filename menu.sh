#! /bin/bash

#this menu is only possible thanks to https://gist.github.com/wafsek example

clear


function App {

{
	{
	ints=$(vmstat 1 2 | tail -1 | awk '{print $11}')
        result="Number of interupts in the last secound:  $ints"
	echo 100
	echo $result > result
	} | whiptail --gauge "Getting data ..." 6 60 50
}

while [ 1 ]
do
App=$(
whiptail --title "Software" --menu "Select the app you want to run" 16 100 9 \
	"1)" "BYOB"   \
	"2)" "OpenSSH-start"  \
	"3)" "OpenSSH-stop" \
	"4)" "Phoneinfoga" \
	"5)" "Nextcloud" \
	"6)" "Reinstall all apps" \
	"9)" "End script"  3>&2 2>&1 1>&3	
)



case $CHOICE in
	"1)")   
		chmod u+x byob_run.sh
        ./byob_run.sh
	;;
	"2)")   
	    sudo systemctl start ssh
	;;

	"3)")   
	    sudo systemctl stop ssh
        ;;

	"4)")   
	    chmod u+x Phoneinfoga_run.sh
        ./Phoneinfoga_run.sh
        ;;

	"5)")   
        chmod u+x Nextcloud_run.sh
        ./Nextcloud_run.sh
        ;;

	"6)")   
		chmod u+x reinstall.sh
        ./reinstall.sh
        ;;

	"9)") exit
        ;;
esac
whiptail --msgbox "$result" 20 78
done
exit

function userKernelMode {
	{	
	raw=( $(grep "cpu " /proc/stat) )
        userfirst=$((${raw[1]} + ${raw[2]}))
        kernelfirst=${raw[3]}
	echo 50
        sleep 1
	raw=( $(grep "cpu " /proc/stat) )
        user=$(( $((${raw[1]} + ${raw[2]})) - $userfirst ))
	echo 90
        kernel=$(( ${raw[3]} - $kernelfirst ))
        sum=$(($kernel + $user))
        result="Percentage of last sekund in usermode: \
        $((( $user*100)/$sum ))% \
        \nand in kernelmode: $((($kernel*100)/$sum ))%"
	echo $result > result
	echo 100
	} | whiptail --gauge "Getting data ..." 6 60 0
} 

function interupts {
	{
	ints=$(vmstat 1 2 | tail -1 | awk '{print $11}')
        result="Number of interupts in the last secound:  $ints"
	echo 100
	echo $result > result
	} | whiptail --gauge "Getting data ..." 6 60 50
}

while [ 1 ]
do
CHOICE=$(
whiptail --title "Operative Systems" --menu "Make your choice" 16 100 9 \
	"1)" "The name of this script."   \
	"2)" "Time since last boot."  \
	"3)" "Number of processes and threads." \
	"4)" "Number of context switches in the last secound." \
	"5)" "How much time used in kernel mode and in user mode in the last secound." \
	"6)" "Number of interupts in the last secound." \
	"9)" "End script"  3>&2 2>&1 1>&3	
)


result=$(whoami)
case $CHOICE in
	"1)")   
		result="I am $result, the name of the script is start"
	;;
	"2)")   
	        OP=$(uptime | awk '{print $3;}')
		result="This system has been up $OP minutes"
	;;

	"3)")   
	        p=$(ps ax | wc -l)
                t=$(ps amx | wc -l)
		result="Number of processes $p\nNumber os threads $t"
        ;;

	"4)")   
	        contextSwitch
		read -r result < result
        ;;

	"5)")   
                userKernelMode
		read -r result < result
        ;;

	"6)")   
		interupts
		read -r result < result
        ;;

	"9)") exit
        ;;
esac
whiptail --msgbox "$result" 20 78
done
exit 
}