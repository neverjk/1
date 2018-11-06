#! /bin/bash
curl https://app.bitpool.com/#/login?pane=organisation >url
number=`grep -i '<script>bpoappversion' url | grep -o "[0-9][0-9]"`
date=$(( `date +%H` + `date +%M` ))
echo "$date"
echo "$number"
if (( "$date" > "$number" ))
then
	echo "$date > $number"
elif (( "$date" < "$number" ))
then
	echo "$date < $number"
else
	echo "$date = $number"
fi

