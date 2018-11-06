#! /bin/bash
curl https://postcode.in.ua/ua/codes/city/1007/a/1 >postcode
for url in postcode
do
	if grep -i "https://postcode.in.ua/ua/codes/city/1007/street/" url>/dev/null
	then
	echo "`grep -io "https://postcode.in.ua/ua/codes/city/1007/street/[0-9][0-9]" url`" >postcode_2
	fi
	
done
for url in postcode_2
do
	html=`curl $url`
	for pnng in html
	do
	if grep -i "https://postcode.in.ua/images/image_c.php?id=[0-9]+" pnng>/dev/null
	then
	
	fi

	
	done
done
