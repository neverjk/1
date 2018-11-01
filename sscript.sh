#! /bin/bash
function menu1(){
while true ; 
do
clear
echo -e "\tUSER MANAGE"
echo "1. create"
echo "2. modify"
echo "3. delete"
echo "4. exit"
	read menu
	case $menu in
	1) create
	;;
	2) modificate
		;;
	3) ddelete
		;;
	4) return ;;

	
	esac
read pause
done
}
function create(){
	echo -e "\tCREATE"
	echo "1. custom"
	echo "2. exit"
	read create
	case $create in
		1) custom;;
	esac
}
function menu2(){
	clear 
	echo "1. name"
	echo "2. UID"
	echo "3. GID"
	echo "4. expire"
	echo "5. comment"
	echo "6. exit"
}
function custom(){
	echo -e "\tCUSTOM"
	clear 
	echo "1. name"
	echo "2. group"
	echo "4. comment"
	echo "5. exit"
	 
	read menu3
	case $menu3 in
		1)  adduser ;;
		2) addgroup ;;
		3) changeGID ;;
		4)comment;;
		5);;
	esac
}
function adduser(){

	echo "enter username: "
	read user_name
	for ffind in /etc/passwd
	do
		if grep -i "^$user_name" /etc/passwd >/dev/null ;
		then
		echo "already excist"
		continue
		else
		useradd $user_name
		break
		fi
		
	done
}
function addgroup(){

	echo "enter group name: "
	read group_name
	for ffind in /etc/group
	do
		if grep -i "^$group_name" /etc/group >/dev/null ;
		then
		echo "already excist"
		continue
		else
		groupadd $group_name
		break
		fi
		
	done
	echo "`grep -i "$group_name"`" 
}

function modificate(){
	echo -e "\tMODIFICATE"
	menu2
	 
	read menu4
	case $menu4 in
		1)  changeuser ;;
		2) changeUID ;;
		3) changeGID ;;
		4);;
		5) comment ;;
		6);;
	esac


}
function ddelete(){
	echo -e "\tDELETE"
	echo -e "1) delete user\n2) delete comment\n3) set expire date 0"
	echo -e "4) exit"
	 
	read menu4
	case $menu4 in
		1) deluser ;;
		2) delcomment ;;
		3) ;;
		4) ;;
		
	esac


}

function changeuser(){
	echo "enter new username: "
	read newuser_name
	echo "enter old username"
	read olduser_name
	if [[ "$newuser_name" == "$olduser_name" ]] 
	then
	echo "usernames are similar"
	else
	for ffind in /etc/passwd
	do
		if grep -i "^$user_name" /etc/passwd >/dev/null ;
		then
		usermod -l $newuser_name $olduser_name
		else
		echo "user not found"
		break
		fi
		
	done
	fi


}
function deluser(){
	echo "enter username to delete: "
	read username_del
	for ffind in /etc/passwd
	do
		if grep -i "^$username_del" /etc/passwd >/dev/null ;
		then
		userdel $username_del
		else
		echo "user not found"
		break
		fi
		
	done
	


}

function changeUID(){
	echo "enter new UID: "
	read new_uid
	echo "enter username"
	read username_uid
	for ffind in /etc/passwd
	do
		if grep -i "^$username_uid" /etc/passwd >/dev/null ;
		then
		if cut -d: -f3 /etc/passwd | grep -w "^$new_uid">/dev/null ; 
			then
			echo "UID is already used"
			break
			else
			usermod -u $new_uid $username_uid
		fi
		else
		echo "user not found"
		break
		fi
		
	done
	


}
function changeGID(){
	echo "enter new GID: "
	read new_gid
	echo "enter username"
	read username_gid
	for ffind in /etc/passwd
	do
		if grep -i "^$username_gid" /etc/passwd >/dev/null ;
		then
		if grep -i "^$username_gid" /etc/passwd | cut -d: -f4 | grep -w "^$new_gid">/dev/null ; 
			then
			echo "GID is already used"
			break
			else
			if cut -d: -f3 /etc/group | grep -i "^$new_gid" >/dev/null ;
			then
			usermod -g $new_gid $username_gid
			
			else
			echo "group is not excist"
			echo "wanna create?"
			read group_yn
			case $group_yn in
			yes)addgroup;;
			y) addgroup;;
			esac
			fi
		fi
		else
		echo "user not found"
		break
		fi
		
	done
	


}

function comment(){
	echo "enter new comment: "
	read comment
	echo "enter username"
	read username_com
	for ffind in /etc/passwd
	do
		if grep -i "^$username_com" /etc/passwd >/dev/null ;
		then
		if cut -d: -f5 /etc/passwd | grep -w "^$new_uid">/dev/null ; 
			then
			echo "comment is the same"
			break
			else
			usermod -c $comment $username_com
		fi
		else
		echo "user not found"
		break
		fi
		
	done
	


}
function delcomment(){
	echo "enter username"
	read username_comdel
	comment=' '
	for ffind in /etc/passwd
	do
		if grep -i "^$username_comdel" /etc/passwd >/dev/null ;
		then
		if cut -d: -f5 /etc/passwd | grep -w "^ ">/dev/null ; 
			then
			echo "comment is the same"
			break
			else
			usermod -c $comment $username_comdel
		fi
		else
		echo "user not found"
		break
		fi
		
	done
	


}

function expire(){
	echo "enter username: "
	read username_ex
	echo "enter expire date"
	read exp
	for ffind in /etc/passwd
	do
		if grep -i "^$username_com" /etc/passwd >/dev/null ;
		then
		if cut -d: -f5 /etc/passwd | grep -w "^$new_uid">/dev/null ; 
			then
			echo "comment is the same"
			break
			else
			usermod -c $comment $username_com
		fi
		else
		echo "user not found"
		break
		fi
		
	done
	

	
	
	
	
	
	
}

menu1

