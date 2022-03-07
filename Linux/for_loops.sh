#!/bin/bash

#list of state variables
states=('Hawaii' 'California' 'Colorado' 'NewYork' 'Georgia')

#create loop that looks for Hawaii
for state in ${states[@]};
 do
  if [ $state == 'Hawaii' ];
  then
   echo "Hawaii is the best!"
  else 
   echo "I'm not fond of Hawaii"
  fi
done

#create variables
nums=$(echo {0..9})

#create for loops
#create loop that prints only 3,5,7.
for num in ${nums[@]};
do
  if [ $num = 3 ] || [ $num = 5 ] || [ $num = 7 ]
  then
   echo $num
  fi
done

ls_out=$(ls)

for x in ${ls_out[@]};
do 
 echo $x
done
