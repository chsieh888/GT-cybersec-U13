#!/bin/bash

#check if script was run as root. Exit if false.
if [ $UID -ne 0 ];
 then
  echo "Please run this script as root" 
fi

#Define Variables
output=$HOME/research/sys_info.txt
ip = $(ip addr | grep inet | tail -2 | head -1)
execs = $(sudo find /home -type f -perm 777 2>/dev/null)
cpu = $(lscpu | grep CPU)
disk = $(df -H | head -2)

#Define lists to use later
commands=( 
 'date'
 'uname -a'
 'hostname -s'
)

files=(
 '/etc/shadow'
 '/etc/shadow'

#check for research dir and create if needed
if [ ! -d $HOME/research ];
 then 
  mkdir $HOME/research
fi

#check for output file. clear it if needed
if [ -f $output ];
 then
  > $output
fi

##############################################################
#start script

echo "Quick system audit script" >> $output
echo "" >> $output

for n in {0..2}; 
 do 
  results=$(${commands[$n]})
   echo "Results of "${commands[$n]}"command:" >> $output
   echo $results >> $output
   echo "" >> $output
 done

#Display Machine Tpye
echo  "Machine Type info:" >> $output
echo -e "$MACHTYPE \n" >> $output

#Display IP Address info
echo -e "IP info:" >> $output
echo -e "$ip \n" >> $output

#Display memory usage
echo -e "\nMemory Info:" >> $output
free >> $output

#Display CPU usage
echo -e "\nCPU info:" >> $output 
lscpu | grep CPU >> $output

#Display disk usage
echo -e "\nDisk Usage:" >>$output
df -H | head -2 >> $output

#Display current user login info.
echo -e "\nCurrent user login info: \n$(Who -a) \n" >> $output

#Display DNS info
echo "DNS servers:" >> $output
cat /etc/resolv.conf >> $output

#list executable files
echo -e "\nexec files:" >> $output
 for execs in $execs;
  do
   echo $exec >> $output
  done

#List top 10 processes 
echo -e "\nTop 10 Processes" >> $output
ps aux --sort -%mem | awk '{print $1,$2,$3,$4,$11}' | head >> $output

#check permissions on files
echo -e "\nThe Permissions for sensitive /etc files: \n" >> $output
for file in ${files[@]};
 do 
  ls -l $file >> $output
 done

