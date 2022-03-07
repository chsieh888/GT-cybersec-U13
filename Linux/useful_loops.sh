#!/bin/bash

#define packages list
packages=( 'nano' 'wget' 'net-tools' )

#loop through the list of packages and check to see if they are installed
for package in ${packages[0]};
do 
  if [ $(which $package) ] 
  then 
   echo "$package is installed at $(which package)."
  else
   echo "$package is not installed."
 fi
done

#search users home dir for scripts and provide formatted output
for user in $(ls /home);
do 
 for item in $(fins /home/$user -iname '*.sh');
 do
  echo -e "Found a script in $user's home folder! \n$item"
 done
done

#loops through scrips in my scripts folder and change the permissions to execute
for script in $(ls ~/scripts);
do
 if [ ! -x ~/scripts/$script ]
 then
  chmod +x ~/scripts/$script
 fi
done


