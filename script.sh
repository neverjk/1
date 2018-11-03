#! /bin/bash

number=`grep -in '<script>bpoAppVersion' url | grep "[0-9]{2}"`

date=$(( `date +%H` + `date +%M` ))
echo "$date"
echo "$number"
if (( "$date" > "$number" ))
then
        echo "$date > $number"
elif (( "$date" < "$number" ))
then
        echo "$date <  $number"
else
        echo "$date = $number"
fi


