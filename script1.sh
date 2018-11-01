#! /bin/bash
function menu(){
	
	while true
	clear
	do
	echo -e "1. mail search\n2. mail statistics\n3. phone search\n4. all cities\n5. city residents\n6. age statistics\n7. exit\n"
	read  menu
	case $menu in
	1) searchMail
	;;
	2) mailStatistics 
	;;
	3) searchNumber
	;;
	4) allCities
	;;
	5) searchCity
	;;
	6) ageStatistics
	;;
	7) return
	;;
	esac
	read pause
	done
}
function searchCity(){
	city=' '
	echo "enter city to search: "
	read city
	echo "$city: `awk '{print $6}' /base/phonebook | grep -ic "$city"` people"
}

function searchMail(){
	mail=' '
	echo "enter e-mail to find: "
	read mail
	echo "$mail: `awk '{print $5}' /base/phonebook | grep -ic "$mail"` people"
}
function searchNumber(){
	number=' '
	echo "enter first numbers: "
	read number
	echo "number: `awk '{print $4}' /base/phonebook | grep "^$number" `"
}
function mailStatistics(){
	all_mail=`awk '{print $5}' /base/phonebook | grep -o "@.*"`
	res=' '
	for res in $all_mail
	do
		if grep -i "$res" /ap/mails >/dev/null ;
		then
		continue
		else
		echo "$res" >> /ap/mails
		fi
	done
	cat /ap/mails


}
function allCities(){
	all_city=`awk '{print $6}' /base/phonebook`
	res=' '
	for res in $all_city
	do
		if grep -i "$res" /ap/cities >/dev/null ;
		then
		continue
		else
		echo "$res (`awk '{print $6}' /base/phonebook | grep -ic "$res"` people)" >> /ap/cities
	fi
	done	
	cat /ap/cities

}
function ageStatistics(){
	echo "30+: `awk '{print $3}' /base/phonebook | grep -c "^[3-9]."`"
	
}
menu

